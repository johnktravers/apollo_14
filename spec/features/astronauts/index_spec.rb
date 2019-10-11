require 'rails_helper'

RSpec.describe 'astronaut index page', type: :feature do

  before :each do
    @neil = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @gail = Astronaut.create(name: 'Gail Hopper', age: 42, job: 'Lead Scientist')
    @nathan = Astronaut.create(name: 'Nathan Baxter', age: 33, job: 'Psychologist')

    @apollo = Mission.create(title: 'Apollo 14', time_in_space: 144)
    @capricorn = Mission.create(title: 'Capricorn 4', time_in_space: 68)
    @gemini = Mission.create(title: 'Gemini 7', time_in_space: 96)

    AstronautMission.create(astronaut_id: @neil.id, mission_id: @apollo.id)
    AstronautMission.create(astronaut_id: @neil.id, mission_id: @gemini.id)
    AstronautMission.create(astronaut_id: @gail.id, mission_id: @capricorn.id)
    AstronautMission.create(astronaut_id: @gail.id, mission_id: @gemini.id)
    AstronautMission.create(astronaut_id: @nathan.id, mission_id: @apollo.id)
  end

  it 'can see a list of all astronauts with name, age, and job' do
    visit '/astronauts'

    within "#astronaut-#{@neil.id}" do
      expect(page).to have_content('Neil Armstrong')
      expect(page).to have_content('Age: 37')
      expect(page).to have_content('Job: Commander')
    end

    within "#astronaut-#{@gail.id}" do
      expect(page).to have_content('Gail Hopper')
      expect(page).to have_content('Age: 42')
      expect(page).to have_content('Job: Lead Scientist')
    end

    within "#astronaut-#{@nathan.id}" do
      expect(page).to have_content('Nathan Baxter')
      expect(page).to have_content('Age: 33')
      expect(page).to have_content('Job: Psychologist')
    end
  end

end