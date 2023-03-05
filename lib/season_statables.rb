module SeasonStatables

  def season_not_found?(season)
    seasons = @game_teams.map(&:season_id)
    if !seasons.include?(season)
     true
    end
  end

  def invalid_season
    'Invalid Season selection'
  end

  def all_goals_by_team_by_season(season)
    team_goals_season = Hash.new(0)
    @game_teams.each do |game|
      if season == game.season_id
      team_goals_season[game.team_id] += game.goals.to_i
      end
    end
    team_goals_season
  end

  def all_shots_by_team_by_season(season)
    team_shots_season = Hash.new(0)
    @game_teams.each do |game|
      if season == game.season_id
      team_shots_season[game.team_id] += game.shots.to_i
      end
    end
    team_shots_season
  end

  def teams_shot_percentage_by_season(season)
    all_goals_by_team_by_season(season).merge(all_shots_by_team_by_season(season)) do |team_id, goals, shots|
      goals.fdiv(shots)
    end
  end

  def team_id_best_shot_perc_by_season(season)
    team_id = teams_shot_percentage_by_season(season).max_by {|_, percentage| percentage}
    team_id.first
  end

  def team_id_worst_shot_perc_by_season(season)
    team_id = teams_shot_percentage_by_season(season).min_by {|_, percentage| percentage}
    team_id.first
  end  

  def game_total(season_year)
    total_game_hash = Hash.new(0)
    @coach_wins = Hash.new(0)
    @game_teams.each do |game|
      if game.season_id == season_year
        total_game_hash[game.coach] += 1
        @coach_wins[game.coach] = 0 
      end
    end
    total_game_hash
  end

  def coach_win(season_year)
    @game_teams.each do |game|
      if game.season_id == season_year 
         if game.result == "WIN"
          @coach_wins[game.coach] += 1
         end
      end
    end
    @coach_wins
  end

  def tackles_total(season)
    team_tackles = Hash.new(0)
    @game_teams.each do |game|
      if game.season_id == season
        team_tackles[game.team_id] += game.tackles.to_i
      end
    end
    team_tackles
  end

end