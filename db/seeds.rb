# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
Event.destroy_all

10.times do
User.create(email: Faker::Internet.email,encrypted_password: Faker::Config.random.seed, description: Faker::Lorem.paragraphs,first_name: Faker::Name.first_name,last_name:Faker::Name.last_name)
Event.create(start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),duration: rand(5..10000),title: Faker::Book.title,description: Faker::Lorem.paragraphs,price: rand(1..1000),location: Faker::Address.city,admin_id: rand(1..50))
end