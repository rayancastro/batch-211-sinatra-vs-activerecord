require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'
get "/" do
  @restaurants = Restaurant.all
  erb :index
end


get "/restaurant/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post "/restaurant" do
  name = params[:name]
  city = params[:city]

  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect "/restaurant/#{restaurant.id}"
end



# As a user I can list all the restaurants
# As a user I can see one restaurant's details
# As a user I can add a restaurant
