require 'faker'

puts "Creating Restaurants"

10.times do
  name = Faker::Coffee.blend_name
  city = Faker::Address.city
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
end

puts "Yay! Now we have #{Restaurant.count} restaurants."
