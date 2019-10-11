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
end
