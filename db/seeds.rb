# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CoffeeSale.destroy_all

1000.times do 
    CoffeeSale.create([
        {
            origin: Faker::Coffee.origin,
            blend: Faker::Coffee.blend_name,
            price: rand(1990...5490),
            date: Faker::Date.between(from: '2017-01-01', to: '2021-04-20')
        }
    ])
end
