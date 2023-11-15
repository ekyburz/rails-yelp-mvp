require 'httparty'

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @random_images = {}
    @restaurants.each do |restaurant|
      @random_images[restaurant.id] =
        random_unsplash_images(query: "restaurants #{restaurant.name}", size: '160x120', count: 1)
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def random_unsplash_images(size:, count:, query:)
    images = []
    count.times do
      images << "https://source.unsplash.com/random/#{size}?#{query}"
    end
    images
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
