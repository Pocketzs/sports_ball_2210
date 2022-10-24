require 'rspec'
require './lib/team'

RSpec.describe Team do
  describe '#initialize' do
    it 'exists' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team).to be_a(Team)
    end

    it 'has a team name' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.name).to eq("Dodgers")
    end

    it 'has a team city' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.city).to eq("Los Angeles")
    end
  end
end