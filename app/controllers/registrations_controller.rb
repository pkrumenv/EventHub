class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.includes(:user, :event).all
  end

  def show
    @registration = Registration.includes(:user, :event).find(params[:id])
  end
end