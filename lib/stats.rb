require 'csv'
require './lib/teams'

class Stats
  attr_reader :teams
  
  def initialize(files)
    @teams = CSV.open(files[:teams], headers: true, header_converters: :symbol).map { |row| Teams.new(row) }
    @games = CSV.open(files[:games], headers: true, header_converters: :symbol).map { |row| Games.new(row) }
    # @game_teams = CSV.open (files[:games], headers: true, header_converters: :symbol).map { |row| Game_Teams.new(row) }
    
  end
end