class Admin::RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all
  end

end
