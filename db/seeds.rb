# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ code: "BWI" }, { code: "ATL" }, { code: "DFW" }, { code: "ATL" }, 
                           { code: "DEN" }, { code: "ORD" }, { code: "JFK" }, { code: "BOS" },
                           { code: "IAD" }, { code: "BNA" }, { code: "DTW" }, { code: "MIA" }])

airports.each do |airport|
  airport.departing_flights.create(start: 2023-8-01, duration: 120, departure_airport: airport, arrival_airport: Airport.last)
end
