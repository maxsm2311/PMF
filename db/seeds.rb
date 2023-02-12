# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

10.times do 
	Category.create(
		name: Faker::Commerce.department,
		description: Faker::Commerce.product_name
	)
end

200.times do 
	Operation.create(
		amount: Faker::Commerce.price,
		odate: Faker::Time.between(from: DateTime.now - 100, to: DateTime.now),
		description: Faker::Commerce.product_name,
		category_id: Faker::Number.within(range: 1..20)
	)
end
