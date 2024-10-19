# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Course.create([
    { title: "Ruby on Rails", description: "Learn Rails from scratch", price: 1999},
    { title: "Js Basics", description: "Intro to Js", price: 999 },
    { title: "Python for Data Science", description: "Data Science to Python", price: 1499 }
])