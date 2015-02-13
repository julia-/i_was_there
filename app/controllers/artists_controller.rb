class ArtistsController < ApplicationController
  before_action :check_if_user, :only => [:new]
  before_action :check_if_admin, :only => [:destroy]

  def index
    if params[:search]
      @artists = Artist.search(params[:search]).order(:name)
    else
      @artists = Artist.order(:name)
    end
  end

   def results
    require 'open-uri'

    keyword = params[:keyword]
    result = JSON.parse(open(URI.encode("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{keyword}&api_key=90a42b1096d510d21e3605d424c165b0&format=json")).read)

    @artist_results = result["artist"]
    @artist_id = Artist.find_by(:mbid => @artist_results["mbid"])

    unless @artist_id.present?
      artist = Artist.create :name => @artist_results["name"], :bio => @artist_results["bio"]["summary"], :image => @artist_results["image"][4]["#text"], :mbid => @artist_results["mbid"]
    end
  end


  def create
    artist = Artist.create artist_params
    redirect_to artist
  end

  def new
    @artist = Artist.new
    @event = Event.find_by :id => params[:event_id]
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def show
    @artist = Artist.find params[:id]
  end

  def update
    artist = Artist.find params[:id]
    artist.update artist_params
    redirect_to artist
  end

  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    redirect_to artists_path
  end

  private
  
  def artist_params
    params.require(:artist).permit(:name, :genre, :city, :country, :bio, :image, :mbid)
  end

  def check_if_user
    redirect_to(login_path) unless @current_user.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @current_user.present? && @current_user.is_admin?
  end
end
