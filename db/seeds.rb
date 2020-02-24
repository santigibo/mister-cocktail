# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
array = JSON.parse(open(url).read)['drinks']

Ingredient.destroy_all

array.each do |a|
  Ingredient.create(name: a['strIngredient1'])
end

# 20.times do
#   c = Cocktail.create(name: "The #{Faker::JapaneseMedia::DragonBall.character.downcase}")
# end
