require 'spec_helper'

RSpec.describe GameStats do
  before(:each) do
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'

    @files = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }
    @game_stat = GameStats.new(@files)
  end  
  describe '#initialize' do
    it 'exists' do
      expect(@game_stat).to be_a(GameStats)
    end
  end

  describe '#highest_total_score' do
    it 'has highest_total_score' do
      expect(@game_stat.highest_total_score).to eq(11)
    end
  end

  describe '#lowest_total_score' do
    it 'has lowest_total_score' do
      expect(@game_stat.lowest_total_score).to eq(0)
    end
  end

  describe '#percentages' do
    it 'can return an array of all home wins' do
      expect(@game_stat.all_home_wins[0]).to be_a(Game)
      expect(@game_stat.all_home_wins.length).to eq(3237)
    end

    it 'has percentage_home_wins' do
      expect(@game_stat.percentage_home_wins).to eq(0.44)
    end

    it 'can return an array of all away wins' do
      expect(@game_stat.all_away_wins[0]).to be_a(Game)
      expect(@game_stat.all_away_wins.length).to eq(2687)
    end

    it 'has percentage_visitor_wins' do
      expect(@game_stat.percentage_visitor_wins).to eq(0.36)
    end

    it 'can return an array of all tie games' do
      expect(@game_stat.all_ties[0]).to be_a(Game)
      expect(@game_stat.all_ties.length).to eq(1517)
    end

    it 'has percentage_ties' do
      expect(@game_stat.percentage_ties).to eq(0.20)
    end
  end

  describe '#count_of_games_by_season' do
    it 'returns a hash of game counts by season' do
      expect(@game_stat.count_of_games_by_season).to eq({
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      })
    end
  end

  describe '#average_goals' do
    it 'can return a float value for average goals per game' do
      expect(@game_stat.average_goals_per_game).to eq(4.22)
    end

    it 'can return a hash of goals by season' do
      expect(@game_stat.goals_by_season).to be_a(Hash)
    end
    it 'can return a hash of average goals by season' do
      expect(@game_stat.average_goals_by_season).to eq({
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      })
    end
  end
end