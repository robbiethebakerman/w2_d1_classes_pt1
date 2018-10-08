require('minitest/autorun')
require('minitest/rg')
require_relative('../students_class')

class TestStudents < MiniTest::Test

  def setup
    @student1 = Students.new('Dave', 'G10')
  end

  def test_get_name
    name = @student1.get_name()
    assert_equal('Dave', name)
  end

  def test_get_cohort
    cohort = @student1.get_cohort
    assert_equal('G10', cohort)
  end

  def test_set_name
    @student1.set_name('Jim')
    new_name = @student1.get_name
    assert_equal('Jim', new_name)
  end

  def test_set_cohort
    @student1.set_cohort('G9')
    new_cohort = @student1.get_cohort
    assert_equal('G9', new_cohort)
  end

  def test_talk
    speech = @student1.talk
    assert_equal("Dave says: 'I can talk!'", speech)
  end

  def test_say_fave_lang
    speech = @student1.say_fave_lang("Ruby")
    assert_equal("Dave says: 'My favourite language is Ruby'.", speech)
  end

end
