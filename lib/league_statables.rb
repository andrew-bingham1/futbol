module LeagueStatables
  def total_goals_by_team
    total_goals_by_team = Hash.new(0)
    @game_teams.each do |game_team|
      total_goals_by_team[game_team.team_id] += game_team.goals.to_i
    end
    total_goals_by_team
  end

  def total_games_by_team
    total_games_by_team = Hash.new(0)
    @game_teams.each do |game_team|
      total_games_by_team[game_team.team_id] += 1
    end
    total_games_by_team
  end

  def average_goal_by_game
    total_goals_by_team.merge!(total_games_by_team) do |team_id, goals, games|
      goals.to_f / games
    end
  end

  def total_goals_by_away_team
    total_goals_by_away_team = Hash.new(0)
    @games.each do |game|
      total_goals_by_away_team[game.away_team_id] += game.away_goals.to_i
    end
    total_goals_by_away_team
  end

  def total_away_games_by_team
    total_away_games_by_team = Hash.new(0)
    @games.each do |game|
      total_away_games_by_team[game.away_team_id] += 1 
    end
    total_away_games_by_team
  end

  def average_goal_by_away_team
    total_goals_by_away_team.merge!(total_away_games_by_team) do |away_team_id, away_goals, away_games|
      away_goals.to_f / away_games
    end
  end

  def total_goals_by_home_team
    total_goals_by_home_team = Hash.new(0)
    @games.each do |game|
      total_goals_by_home_team[game.home_team_id] += game.home_goals.to_i
    end
    total_goals_by_home_team
  end

  def total_home_games_by_team
    total_home_games_by_team = Hash.new(0)
    @games.each do |game|
      total_home_games_by_team[game.home_team_id] += 1 
    end
    total_home_games_by_team
  end

  def average_goal_by_home
    total_goals_by_home_team.merge!(total_home_games_by_team) do |home_team_id, home_goals, home_games|
      home_goals.to_f / home_games
    end
  end
end