# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

neil = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
gail = Astronaut.create(name: 'Gail Hopper', age: 42, job: 'Lead Scientist')
nathan = Astronaut.create(name: 'Nathan Baxter', age: 35, job: 'Psychologist')

apollo = Mission.create(title: 'Apollo 14', time_in_space: 144)
capricorn = Mission.create(title: 'Capricorn 4', time_in_space: 68)
gemini = Mission.create(title: 'Gemini 7', time_in_space: 96)

AstronautMission.create(astronaut_id: neil.id, mission_id: apollo.id)
AstronautMission.create(astronaut_id: neil.id, mission_id: gemini.id)
AstronautMission.create(astronaut_id: gail.id, mission_id: capricorn.id)
AstronautMission.create(astronaut_id: gail.id, mission_id: gemini.id)
AstronautMission.create(astronaut_id: nathan.id, mission_id: apollo.id)
