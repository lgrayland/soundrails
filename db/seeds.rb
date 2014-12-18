# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Genre.delete_all

Genre.create!(name: "Dance")
Genre.create!(name: "Rock")
Genre.create!(name: "Pop")

User.delete_all

User.create!(email: "admin@admin.com", password: "password", role: "admin",)
User.create!(email: "artist@artist.com", password: "password", role: "artist",)
User.create!(email: "user@user.com", password: "password", role: "user",)

# Comment.delete_all

# Track.delete_all