# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Categories
10.times { Category.create!(name: Faker::Lorem.word) }

# Create sources
10.times { Source.create!(name: Faker::Company.name) }

# Create Articles
50.times {
  category = Category.all.sample
  source = Source.all.sample
  Article.create!(
    title: Faker::Lorem.sentence,
    url: Faker::Internet.url,
    category: category,
    source: source
  )
}