# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
puts "Deleted all existing Airports"
puts "Creating new Airports..."
airports = Airport.create([{ code: "BWI" }, { code: "ATL" }, { code: "DFW" }, 
                           { code: "ORD" }, { code: "JFK" }, { code: "BOS" },
                           { code: "IAD" }, { code: "BNA" }, { code: "DTW" }])
shuffled_airports = airports.shuffle

puts "Created #{airports.count} new airports."        

Flight.delete_all

puts "Deleted all existing Flights"
puts "Creating new Flights:"
1000.times do |i|
  shuffled_airports = airports.shuffle
  Flight.create([{ departure_airport: shuffled_airports.pop, arrival_airport: shuffled_airports.pop, departure_date: DateTime.now + rand(31).days, duration: rand(90...360) }])
  puts "#{1000 - i} flights remaining."
end

puts "Created #{Flight.all.count} new flights"
