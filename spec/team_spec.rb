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

    it 'starts with an empty team roster' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.roster).to eq([])
    end
  end

  describe '#player_count' do
    it 'starts with no players' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.player_count).to eq(0)
    end
  end

  describe '#add_player' do
    it 'can add a player to the team roster' do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous", 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)

      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.roster).to eq([player_1, player_2])
      expect(team.player_count).to eq(2)
    end
  end

  describe '#long_term_players' do
    it 'stores player if their contract is greater than two years' do
      team = Team.new("Dodgers", "Los Angeles")

      player_1 = Player.new("Michael Palledorous", 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq([player_1, player_3])
    end
  end

  describe '#short_term_players' do
    it 'stores player if their contract is two years or less' do
      team = Team.new("Dodgers", "Los Angeles")

      player_1 = Player.new("Michael Palledorous", 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.short_term_players).to eq([player_2, player_4])
    end
  end

  describe 'total_value' do
    it 'returns the total cost of all the players' do
      team = Team.new("Dodgers", "Los Angeles")

      player_1 = Player.new("Michael Palledorous", 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq(85200000)
    end
  end
end