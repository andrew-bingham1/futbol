require 'spec_helper'

RSpec.describe LeagueStats do
  before(:each) do 
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'

    @files = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }
    @league_stat = LeagueStats.new(@files)
  end  
  describe '#initialize' do
    it 'exists' do
      expect(@league_stat).to be_a(LeagueStats)
    end
  end

  describe '#counts teams' do
    it 'returns an integer of team count' do
      expect(@league_stat.count_of_teams).to eq(32)
    end
  end

  describe '#offenses' do
    it 'returns string of best offense' do
      expect(@league_stat.best_offense).to eq('Reign FC')
    end

    it 'returns string of worst offense' do
      expect(@league_stat.worst_offense).to eq('Utah Royals FC')
    end
  end

  describe '#helper methods for offenses' do
    it 'checks total goals by team' do
      expect(@league_stat.total_goals_by_team).to be_a Hash
    end

    it 'checks total games by team' do
      expect(@league_stat.total_games_by_team).to be_a Hash
    end

    it 'has average' do
      expect(@league_stat.average_goal_by_game).to be_a Hash
    end
  end

  describe '#highest scores' do
    it 'returns string of visitor high score' do
      expect(@league_stat.highest_scoring_visitor).to eq('FC Dallas')
    end

    it 'returns string of home team high score' do
      expect(@league_stat.highest_scoring_home_team).to eq('Reign FC')
    end
  end

  describe '#lowest scores' do
    it 'returns string of visitor low score' do
      expect(@league_stat.lowest_scoring_visitor).to eq('San Jose Earthquakes')
    end

    it 'returns string of home team low score' do
      expect(@league_stat.lowest_scoring_home_team).to eq('Utah Royals FC')
    end
  end

  describe '#helper methods for away team' do
    it 'has total goals by away team' do
      expect(@league_stat.total_goals_by_away_team).to be_a Hash
    end

    it 'has total games by away team' do
      expect(@league_stat.total_away_games_by_team).to be_a Hash
    end

    it 'has average' do
      expect(@league_stat.average_goal_by_away_team).to be_a Hash
    end
  end

  describe '#helper methods for home team' do
    it 'has total goals by away team' do
      expect(@league_stat.total_goals_by_home_team).to be_a Hash
    end

    it 'has total games by home team' do
      expect(@league_stat.total_home_games_by_team).to be_a Hash
    end

    it 'has average' do
      expect(@league_stat.average_goal_by_home).to be_a Hash
    end
  end
end