require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def test_finds_a_task
    attributes = {:id => 1, :description => "This task", :title => "New task"}
    TaskManager.create(attributes)
    task = TaskManager.find(1)
    assert_equal task.description, "This task"
    assert_equal task.title, "New task"
  end

  def test_it_creates_a_task
    attributes = {:id => 1, :description => "This task", :title => "New task"}
    TaskManager.create(attributes)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end

  def test_it_updates_a_task
    attributes = {:id => 1, :description => "This task", :title => "New task"}
    TaskManager.create(attributes)
    new_attributes = {:id => 1, :description => "This other task", :title => "Newer task"}
    TaskManager.update(1, new_attributes)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "This other task", task.description
    assert_equal "Newer task", task.title
  end

  def create_three_tasks
    attributes = {:id => 1, :description => "This task", :title => "New task"}
    TaskManager.create(attributes)
    attributes2 = {:id => 2, :description => "This second task", :title => "New second task"}
    TaskManager.create(attributes2)
    attributes3 = {:id => 3, :description => "This third task", :title => "New third task"}
    TaskManager.create(attributes3)
  end

  def test_all_returns_all_tasks
    create_three_tasks
    all_the_tasks = TaskManager.all

    assert_equal 3, all_the_tasks.size
  end

  def test_it_deletes_a_task
    create_three_tasks
    task = TaskManager.find(1)
    all_the_tasks = TaskManager.all

    assert_equal 1, task.id
    assert_equal 3, all_the_tasks.size

    TaskManager.delete(1)
    fewer_tasks = TaskManager.all

    assert_equal 2, fewer_tasks.size
  end

end
