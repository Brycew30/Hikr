class LocationsController < ApplicationController
  before_action :require_login

  def index
    @trails = Trail.all.alphabetical_order
  end

  def show
  end

end
