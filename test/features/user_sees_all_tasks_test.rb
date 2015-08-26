require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest
  def test_title_content_is_on_page
    visit "/"
    assert page.has_content?("Welcome to the Task Manager")
  end

  def test_front_page_has_welcome_in_greeting
    visit "/"
    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end

  def test_explanation_has_turducken
    visit "/"
    within("#about_explanation") do
      assert page.has_content?("turducken")
    end
  end

end
