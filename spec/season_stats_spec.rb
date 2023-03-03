require 'spec_helper'

RSpec.describe SeasonStats do
  before(:each) do
    @season_stat = SeasonStats.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@season_stat).to be_a(SeasonStats)
    end
  end

  describe '#all_goals_by_team_by_season' do
    it 'can create a hash of all teams and their goals by a season' do
      expect(@season_stat.all_goals_by_team_by_season('20132014')).to be_a Hash
      expect(@season_stat.all_goals_by_team_by_season('20132014').length).to eq(30)
      expect(@season_stat.all_goals_by_team_by_season('20132014')['1']).to eq(157)
    end
  end

  describe '#all_shots_by_team_by_season' do
    it 'can crate a hash of all teams and their shots by a season' do
      expect(@season_stat.all_shots_by_team_by_season('20132014')).to be_a Hash
      expect(@season_stat.all_shots_by_team_by_season('20132014').length).to eq(30)
      expect(@season_stat.all_shots_by_team_by_season('20132014')['1']).to eq(513)
    end
  end

  describe '#teams_shot_percentage_by_season' do
    it 'can return a hash of all teams and their shot percentages' do
      expect(@season_stat.teams_shot_percentage_by_season('20132014')).to be_a Hash
      expect(@season_stat.teams_shot_percentage_by_season('20132014').length).to eq(30) 
      expect(@season_stat.teams_shot_percentage_by_season('20132014')['1']).to eq(0.3060428849902534) 
    end
  end

  describe '#team_id_best_shot_perc_by_season' do
    it 'can return the team id of the team with the best shot percentage' do
      expect(@season_stat.team_id_best_shot_perc_by_season('20132014')).to eq('24')
      expect(@season_stat.team_id_best_shot_perc_by_season('20142015')).to eq('20')
    end
  end

  describe '#team_id_worst_shot_perc_by_season' do
    it 'can return the team id of the team with the worst shot percentage' do
      expect(@season_stat.team_id_worst_shot_perc_by_season('20132014')).to eq('9')
      expect(@season_stat.team_id_worst_shot_perc_by_season('20142015')).to eq('53')
    end
  end

  describe '#most_accurate_team' do
    it 'can return the team with the most accuracy per season' do
      expect(@season_stat.most_accurate_team('20132014')).to eq('Real Salt Lake')
      expect(@season_stat.most_accurate_team('20142015')).to eq('Toronto FC')
    end
  end

  describe '#least_accurate_team' do
    it 'can return the team with the least accuracy pr season' do
      expect(@season_stat.least_accurate_team('20132014')).to eq('New York City FC')
      expect(@season_stat.least_accurate_team('20142015')).to eq('Columbus Crew SC')
    end
  end

  describe '#coach methods' do 
    it '#winningest_coach' do
      expect(@season_stat.winningest_coach('20132014')).to eq('Claude Julien')
      expect(@season_stat.winningest_coach('20142015')).to eq('Alain Vigneault')
    end 

    it '#worst_coach' do
      expect(@season_stat.worst_coach('20132014')).to eq('Peter Laviolette')
      expect(@season_stat.worst_coach('20142015')).to eq('Craig MacTavish').or(eq('Ted Nolan'))
    end
  end

  describe '#tackle methods' do
    it "#most_tackles" do
      expect(@stat_tracker.most_tackles("20132014")).to eq "FC Cincinnati"
      expect(@stat_tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
    end

    it "#fewest_tackles" do
      expect(@stat_tracker.fewest_tackles("20132014")).to eq "Atlanta United"
      expect(@stat_tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
    end
  end
end