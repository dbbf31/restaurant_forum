class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

end
