# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all
UserAllergy.destroy_all

severity_array = ["low", "medium", "high"]

10.times do
    User.create(name: Faker::FunnyName.name, email: Faker::Internet.email, occupation: Faker::Job.title, experience: rand(1..10))
end

20.times do
    Recipe.create(name: Faker::Food.dish, description:Faker::Food.description, img_url: "https://www.studentproblems.com/wp-content/uploads/2018/05/h6.jpg", user_id: User.all.sample.id)
end

20.times do
    Ingredient.create(name: Faker::Food.ingredient, calories: rand(100..700))
end

40.times do
    RecipeIngredient.create(recipe_id: Recipe.all.sample.id, ingredient_id: Ingredient.all.sample.id)
end

20.times do
    UserAllergy.create(user_id: User.all.sample.id, ingredient_id: Ingredient.all.sample.id, severity: severity_array.sample)
end
