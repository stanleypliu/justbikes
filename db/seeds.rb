require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Users"

# user seeds
5.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: "123456",
    name: Faker::Name.name
  )
end

puts "Users created"

puts "Creating Bikes"
# bicycle seeds
10.times do
  Bicycle.create!(
    location: Faker::Nation.capital_city,
    style: Faker::Color.color_name,
    price: rand(5..20),
    size: ["small", "medium", "large"].sample,
    title: Faker::Science.scientist,
    user_id: rand(1..5)
  )
end

puts "Bikes created"
