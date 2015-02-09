class ArtistsController < ApplicationController
  before_action :check_if_user, :only => [:new]
  before_action :check_if_admin, :only => [:destroy]

  def index
    @artists = Artist.order(:name)
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
    params.require(:artist).permit(:name, :genre, :city, :country, :bio, :image)
  end

  def check_if_user
    redirect_to(root_path) unless @current_user.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @current_user.present? && @current_user.is_admin?
  end
end
