# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Admin", password: "password")
User.create(username: Faker::Name.name, password: "password")
User.create(username: Faker::Name.name, password: "password")
User.create(username: Faker::Name.name, password: "password")
User.create(username: Faker::Name.name, password: "password")

users = User.all

5.times do |n|
  cur = users[rand(0..(users.length-1))]
  cur.messages.create(body: Faker::Lorem.sentence(10))
end
