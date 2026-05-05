class EventsController < ApplicationController
  def index
    @events = Event.includes(:user, :categories).all
  end

  def show
    @event = Event.includes(:user, :categories, :registrations, :reviews).find(params[:id])
  end
end