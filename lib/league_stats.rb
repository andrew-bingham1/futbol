require 'csv'
require 'team'
require 'game_teams'
require 'game'

class LeagueStats
  attr_reader :teams,
              :game_teams,
              :games

  def initialize
    @teams = CSV.open('./data/teams.csv', headers: true, header_converters: :symbol).map { |row| Team.new(row) }
    @game_teams = CSV.open('./data/game_teams.csv', headers: true, header_converters: :symbol).map { |row| GameTeams.new(row) }
    @games = CSV.open('./data/games.csv', headers: true, header_converters: :symbol).map { |row| Game.new(row) }
  end

  def count_of_teams
    @teams.count
  end

  def best_offense
    total_goals_by_team = Hash.new(0)
    total_games_by_team = Hash.new(0)
    @game_teams.each do |game_team|
      total_goals_by_team[game_team.team_id] += game_team.goals.to_i
    end
    @game_teams.each do |game_team|
      total_games_by_team[game_team.team_id] += 1
    end
    total_goals_by_team.merge!(total_games_by_team) do |team_id, goals, games|
      goals.to_f / games
    end
    @teams.each do |team|
      if team.team_id == total_goals_by_team.key(total_goals_by_team.values.max)
        return team.team_name
      end
    end
  end

  def worst_offense
    total_goals_by_team = Hash.new(0)
    total_games_by_team = Hash.new(0)
    @game_teams.each do |game_team|
      total_goals_by_team[game_team.team_id] += game_team.goals.to_i
    end
    @game_teams.each do |game_team|
      total_games_by_team[game_team.team_id] += 1
    end
    total_goals_by_team.merge!(total_games_by_team) do |team_id, goals, games|
      goals.to_f / games
    end
    @teams.each do |team|
      if team.team_id == total_goals_by_team.key(total_goals_by_team.values.min)
        return team.team_name
      end
    end
  end

  def highest_scoring_visitor
    total_away_games_by_team = Hash.new(0)
    total_goals_by_away_team = Hash.new(0)
    @games.each do |game|
      total_away_games_by_team[game.away_team_id] += 1 
    end
    @games.each do |game|
      total_goals_by_away_team[game.away_team_id] += game.away_goals.to_i
    end
    total_goals_by_away_team.merge(total_away_games_by_team) do |away_team_id, away_goals, games|
      away_goals.to_f / games
    end
    @teams.each do |team| 
      if team.away_team_id == total_goals_by_away_team.key(total_goals_by_away_team.values.max)
        return team.team_name
      end
    end
  end
end