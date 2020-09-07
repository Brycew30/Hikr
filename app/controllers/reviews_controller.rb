class ReviewsController < ApplicationController
  def index
    if find_trail
      @review = @trail.reviews.all
    else
      all_trails
      @reviews = Review.all
    end
  end


  private

  def find_trail
    @trail = Trail.find_by_id(params[:trail_id])
  end

  def all_trails
    @trails = Trail.all
  end
end
