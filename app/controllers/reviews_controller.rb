class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:user, :event).all
  end

  def show
    @review = Review.includes(:user, :event).find(params[:id])
  end
end