# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
    email = Faker::Internet.unique.email
    name = Faker::Games::Pokemon.name
    username = Faker::DcComics.hero
    # username = Faker.internet.userName(name)
    # username = Faker::Games::Pokemon.unique.username
    password = "password"
    User.create!(email: email,
                 name: name,
                 username: username,
                 password: password,
                 )
end