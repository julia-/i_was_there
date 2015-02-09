class EventsController < ApplicationController
  before_action :check_if_user, :only => [:new]
  before_action :check_if_admin, :only => [:destroy]

  def index
    @events = Event.all
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
    params.require(:event).permit(:date, :venue_name, :venue_location, :image)
  end

  def check_if_user
    redirect_to(root_path) unless @current_user.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @current_user.present? && @current_user.is_admin?
  end
end
