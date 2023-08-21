# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
put 'Seeding data...'
Hero.create([{name: 'Bruce Wayne',super_name: 'Batman'},{name: 'Matt Murdock',super_name: 'Daredevil'},{name: 'Tony Stark',super_name: 'Iron Man'}])
Power.create([{name: 'Super Strength',description: 'gives the wielder super-human strengths'},
              {name: 'Flight',description: 'gives the wielder the ability to fly through the skies at supersonic speed'},
              {name: 'Super speed', description: 'gives the wielder the ability at supersonic speed'}])
HeroPower.create([{strength: 'Average',hero_id: 1, power_id: 1},{strength: 'Strong',hero_id: 1, power_id: 2},{strength: 'Strong',hero_id: 2, power_id: 1}])              
put 'Seeded data...'