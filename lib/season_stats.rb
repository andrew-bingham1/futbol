require_relative 'stats'
require_relative 'season_statables'

class SeasonStats < Stats 
  include SeasonStatables

  def initialize(files)
    super
    @coach_wins = Hash.new(0)
  end

  def most_accurate_team(season)
    return invalid_season if season_not_found?(season)
    team = @teams.select do |team|
     team.team_id == team_id_best_shot_perc_by_season(season)
    end
    team.first.team_name
  end

  def least_accurate_team(season)
    return invalid_season if season_not_found?(season)
    team = @teams.select do |team|
     team.team_id == team_id_worst_shot_perc_by_season(season)
    end
    team.first.team_name
  end

  def winningest_coach(season)
    return invalid_season if season_not_found?(season)
    coaches = game_total(season).merge(coach_win(season)) {|coach, games, wins| wins.to_f / games}
    coaches.key(coaches.values.max)
  end

  def worst_coach(season)
    return invalid_season if season_not_found?(season)
    coaches = game_total(season).merge(coach_win(season)) {|coach, games, wins| wins.to_f / games}
    coaches.key(coaches.values.min)
  end

  def most_tackles(season)
    return invalid_season if season_not_found?(season)
    @teams.each do |team| 
      if team.team_id == tackles_total(season).key(tackles_total(season).values.max)
        return team.team_name
      end
    end
  end

  def fewest_tackles(season)
    return invalid_season if season_not_found?(season)
    @teams.each do |team| 
      if team.team_id == tackles_total(season).key(tackles_total(season).values.min)
        return team.team_name
      end
    end
  end
end


