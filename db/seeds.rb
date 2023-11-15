puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
dishoom = { name: 'Dishoom', address: '7 Boundary St, London E2 7JE', category: 'chinese' }
pizza_east = { name: 'Pizza East', address: '56A Shoreditch High St, London E1 6PQ', category: 'italian' }
alchimia = { name: 'Alchimia', address: 'Embrach', category: 'italian' }
mcdonalds = { name: 'McDonalds', address: 'Zurich', category: 'belgian' }
gupf = { name: 'Gupf', address: 'Appenzell', category: 'french' }

[dishoom, pizza_east, alchimia, mcdonalds, gupf].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts 'Finished!'
