# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10.00)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************

# Create Reviews Here

rev1 = Review.create(star_rating: 4, comment: "Great Product", product_id: product1.id, user_id: user1.id)
rev2 = Review.create(star_rating: 1, comment: "Horrible Product", product_id: product2.id, user_id: user1.id)
rev3 = Review.create(star_rating: 2, comment: "Decent", product_id: product3.id, user_id: user1.id)

puts "Seeding done!"
puts

#   1st deliverable
puts "Review#user"
puts rev1.user.name
puts
puts "Review#product"
puts rev1.product.name
puts
puts "Product#reviews"
puts product1.reviews.map(&:comment)
puts product1.reviews.map(&:star_rating)
puts
puts "Product#users"
puts product1.users.map(&:name)
puts
puts "User#reviews"
puts user1.reviews.map(&:star_rating)
puts user1.reviews.map(&:comment)
puts
puts "User#products"
puts user1.products.map(&:name)
puts
puts

puts "Review#print_review"
puts rev1.print_review
puts

puts "Product#leave_review(user, star_rating, comment)"
p_leave_rev = product3.leave_review(user2, 4, "Nice")
puts p_leave_rev.print_review

puts "Product#print_all_reviews"
puts product1.print_all_reviews
puts

puts "Product#average_rating"
puts product1.average_rating
puts

puts "User#favorite_product"
puts user1.favorite_product.name
puts

puts "User#remove_reviews(product)"
puts user1.remove_reviews(product1)
puts