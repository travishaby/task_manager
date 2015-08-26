require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def make_task
    visit "/"
    click_link('New Task')
    fill_in('task[title]', :with => 'Win at FF')
    fill_in('task[description]', :with => 'CRUSH ALL THAT OPPOSE ME')
    click_on('submit')
  end

  def test_user_creates_a_task
    visit "/tasks"
    refute page.has_content?('Win at FF')

    make_task

    assert_equal '/tasks', current_path
    assert page.has_content?('Win at FF')
  end

  def test_user_can_edit_a_task
    make_task

    visit "/tasks"
    assert page.has_content?('Win at FF')

    click_on('edit-task-1')

    assert_equal '/tasks/1/edit', current_path
  end

end
