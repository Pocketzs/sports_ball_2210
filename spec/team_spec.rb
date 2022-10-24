require 'rspec'
require './lib/team'

RSpec.describe Team do
  describe '#initialize' do
    it 'exists' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team).to be_a(Team)
    end
  end
end