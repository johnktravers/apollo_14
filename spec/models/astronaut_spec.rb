require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'self.average_age' do
    it 'can calculate the average age of all astronauts' do
      Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      Astronaut.create(name: 'Gail Hopper', age: 42, job: 'Lead Scientist')
      Astronaut.create(name: 'Nathan Baxter', age: 35, job: 'Psychologist')

      expect(Astronaut.average_age).to eq(38)
    end
  end

  describe '#total_time_in_space' do
    it 'can calculate the total time an astronaut has spent in space' do
      neil = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')

      apollo = Mission.create(title: 'Apollo 14', time_in_space: 144)
      capricorn = Mission.create(title: 'Capricorn 4', time_in_space: 68)
      gemini = Mission.create(title: 'Gemini 7', time_in_space: 96)

      AstronautMission.create(astronaut_id: neil.id, mission_id: gemini.id)
      AstronautMission.create(astronaut_id: neil.id, mission_id: apollo.id)
      AstronautMission.create(astronaut_id: neil.id, mission_id: capricorn.id)

      expect(neil.total_time_in_space).to eq(308)
    end
  end
end
