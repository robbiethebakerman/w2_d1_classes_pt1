require('minitest/autorun')
require('minitest/rg')
require_relative('../teams_class')

class TestTeams < MiniTest::Test

  def setup
    @team1 = Team.new('Arsenal', ['Henry', 'Bergkamp', 'Adams', 'Vieira'], 'Wenger')
  end

  def test_get_team_name
    assert_equal('Arsenal', @team1.get_team_name)
  end

  def test_get_players
    assert_equal(['Henry', 'Bergkamp', 'Adams', 'Vieira'], @team1.get_players)
  end

  def test_get_coach
    assert_equal('Wenger', @team1.get_coach)
  end

  def test_set_coach
    @team1.set_coach('Emery')
    assert_equal('Emery', @team1.get_coach)
  end

end
