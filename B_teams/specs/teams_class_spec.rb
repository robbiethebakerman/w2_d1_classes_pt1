require('minitest/autorun')
require('minitest/rg')
require_relative('../teams_class')

class TestTeams < MiniTest::Test

  def setup
    @team1 = Team.new('Arsenal', ['Henry', 'Bergkamp', 'Adams', 'Vieira'], 'Wenger')
  end

  def test_get_team_name
    assert_equal('Arsenal', @team1.team_name())
  end

  def test_get_players
    assert_equal(['Henry', 'Bergkamp', 'Adams', 'Vieira'], @team1.players())
  end

  def test_get_coach
    assert_equal('Wenger', @team1.coach())
  end

  def test_get_points
    assert_equal(0, @team1.points)
  end

  def test_set_coach
    @team1.coach = 'Emery'
    assert_equal('Emery', @team1.coach())
  end

  def test_add_player
    @team1.add_player('Sanchez')
    assert_equal('Sanchez', @team1.players[4])
  end

  def test_include_player__true
    assert_equal(true, @team1.include_player?('Henry'))
  end

  def test_include_player__false
    assert_equal(false, @team1.include_player?('Aguero'))
  end

  def test_update_points__win
    @team1.update_points('win')
    assert_equal(3, @team1.points)
  end

  def test_update_points__lose
    @team1.update_points('lose')
    assert_equal(0, @team1.points)
  end

end
