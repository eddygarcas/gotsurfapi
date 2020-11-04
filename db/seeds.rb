# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "bot@gotsurf.com",password:Rails.application.credentials.telegram_bot[:access_key])
Spot.create(point: 2111136,city: "Barcelona",flag: "🇪🇸")
Spot.create(point: 711015017,city: "Tarragona",flag: "🇪🇸")
Spot.create(point: 2090125,city: "Vinaroç",flag: "🇪🇸")
Spot.create(point: 2123118,city: "Alcudia",flag: "🇪🇸")
Spot.create(point: 112074042,city:"Bilbao",flag: "🇪🇸")
Spot.create(point: 3181033,city: "Donosti",flag: "🇪🇸")
Spot.create(point: 3138035,city: "Santander",flag: "🇪🇸")

