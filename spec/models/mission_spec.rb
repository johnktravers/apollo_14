require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:astronauts).through(:astronaut_missions)}
  end

  describe 'self.order_alpha' do
    it 'can order missions alphabetically by title' do
      capricorn = Mission.create(title: 'Capricorn 4', time_in_space: 68)
      gemini = Mission.create(title: 'Gemini 7', time_in_space: 96)
      apollo = Mission.create(title: 'Apollo 14', time_in_space: 144)

      expect(Mission.order_alpha).to eq([apollo, capricorn, gemini])
    end
  end
end
