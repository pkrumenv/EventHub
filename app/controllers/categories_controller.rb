class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:events).all
  end

  def show
    @category = Category.includes(:events).find(params[:id])
  end
end