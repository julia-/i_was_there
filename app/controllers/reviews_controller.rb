class ReviewsController < ApplicationController
  before_action :check_if_user, :only => [:new]
  before_action :check_if_owner, :only => [:edit, :update]

  def index
    if params[:search]
      @reviews = Review.search(params[:search]).order('created_at DESC')
    else
      @reviews = Review.order('created_at DESC')
    end
  end

  def create
    @current_user = User.find_by :id => session[:user_id]
    review = @current_user.reviews.create(review_params)
    redirect_to review
  end

  def new
    @review = Review.new
    @event = Event.find_by :id => params[:id]
  end

  def edit
    @review = Review.find params[:id]
    @event = Event.find_by :id => params[:event_id]
  end

  def show
    @review = Review.find params[:id]
  end

  def update
    review = Review.create review_params
    redirect_to review
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :content, :image, :event_id)
  end

  def check_if_user
    redirect_to(root_path) unless @current_user.present?
  end

  def check_if_owner
    @owner = @current_user.reviews.find_by(id: params[:id])
    redirect_to reviews_path if @owner.nil?
  end
  def check_if_admin
    redirect_to(root_path) unless @current_user.present? && @current_user.is_admin?
  end
end
