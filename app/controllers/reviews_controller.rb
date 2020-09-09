class ReviewsController < ApplicationController

  before_action :require_login

  def index
    if find_trail
      @review = @trail.reviews.all
    else
      all_trails
      @reviews = Review.all
    end
  end

  def new
    if find_trail
      @review = @trail.reviews.build
    else
      all_trails
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:message] = "Thanks for the review!"
      redirect_to review_path(@review)
    else
      all_trails
      render :new
    end
  end

  def show
    unless !(@review == nil)
      redirect_to reviews_path
    end
  end

  def edit
    all_trails
  end

  def update
    if review_params.present? && review_params[:trail_id].present?
      @review.update(review_params)
      save_review
    else
      flash[:message] = "Please make sure you fill in all the necessary fields!"
      all_trails
      render :edit
    end
  end

  def destroy
    if @review
      @review.destroy
      flash[:message] = "Review successfully removed!"
      redirect_to reviews_path
    else
      flash[:message] = "The review couldn't be removed."
      redirect_to review_path(@review)
    end
  end


  private

  def review_params
    params.require(:review).permit(:stars, :title, :content, :trail_id)
  end

  def find_trail
    @trail = Trail.find_by_id(params[:trail_id])
  end

  def all_trails
    @trails = Trail.all
  end

  def save_review
    if @review.save
      flash[:message] = "'#{@review.title}' was updated!"
      redirect_to review_path(@review)
    else
      all_trails
      render :edit
    end
  end
end
