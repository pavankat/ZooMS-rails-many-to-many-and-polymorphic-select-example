# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@lionOne = Lion.create(birthdate: "2015-08-03", name: "broo", about: "brooooo", weight: 333, health: 8, health_notes: "so healthy")

@lionTwo = Lion.create(birthdate: "2015-08-03", name: "brosky", about: "broin out man", weight: 199, health: 9, health_notes: "just chillin")

@lionThree = Lion.create(birthdate: "2015-08-03", name: "Coolawski", about: "totally cool", weight: 180, health: 10, health_notes: "Perfecto ten")

@ltOne = LionTamer.create(name: "Pavan", experience: 8, living: true)

@ltTwo = LionTamer.create(name: "Akira", experience: 99, living: true)

@pOne = Panther.create(name: "Eric", claw_length: 8)

@pTwo = Panther.create(name: "Peter", claw_length: 9)

@catToyOne = CatToy.create(name: "ball", toyable_id: 1, toyable_type: "Lion")

@catToyTwo = CatToy.create(name: "string!", toyable_id: 2, toyable_type: "Panther")

