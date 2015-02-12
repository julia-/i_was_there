class EventsController < ApplicationController
  before_action :check_if_user, :only => [:new]
  before_action :check_if_admin, :only => [:destroy]

  # All event records stored display when page loads.
  def index
    if params[:search]
      @events = Event.search(params[:search]).order(:date)
    else
      @events = Event.order(:date)
    end
  end

  def results
    require 'open-uri'

    keyword = params[:keyword]
    result = JSON.parse(open(URI.encode("http://ws.audioscrobbler.com/2.0/?method=artist.getpastevents&artist=#{keyword}&api_key=90a42b1096d510d21e3605d424c165b0&format=json")).read)

    @past_events = result["events"]["event"]

    @past_events = [@past_events] unless @past_events.is_a? Array

    @past_events.each do |e|
      @event_id = Event.find_by(:id_event => e["id"])
      
      unless @event_id.present?
        unless e["artists"]["artist"].is_a? Array
          e["artists"]["artist"] = [ e["artists"]["artist"] ]
        end

        event = Event.new do |event|
          event.title = e["title"]
          event.artist = e["artists"]["artist"].join(', ')
          event.headliner = e["artists"]["headliner"]
          event.date = e["startDate"]
          event.venue_name = e["venue"]["name"]
          event.city = e["venue"]["location"]["city"]
          event.country = e["venue"]["location"]["country"]
          event.id_event = e["id"]
          event.latitude = e["venue"]["location"]["geo:point"]["geo:lat"]
          event.longitude = e["venue"]["location"]["geo:point"]["geo:long"]
        end

        event.save
      end
    end
  end

  def create
    event = Event.create event_params
    redirect_to event
  end

  def new
    @event = Event.new
  end

  def add_artist
    @event = Event.find params[:id]
    @artist = Artist.new
  end

  def create_artist
    event = Event.find params[:id]
    artist = Artist.find_by :id => params[:events][:artist_ids]
    event.artists << artist
    event.save
    redirect_to event
  end

  def edit
    @event = Event.find params[:id]
  end

  def show
    @event = Event.find params[:id]
  end

  def update
    event = Event.find params[:id]
    event.update event_params
    redirect_to event
  end

  def destroy
    event = Event.find params[:id]
    event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :headliner, :artist, :venue_name, :city, :country, :latitude, :longitude, :image, :id_event, :search)
  end

  def check_if_user
    redirect_to(root_path) unless @current_user.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @current_user.present? && @current_user.is_admin?
  end
end
