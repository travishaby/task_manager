require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def test_finds_a_task
    attributes = {:description => "This task", :title => "New task"}
    task = TaskManager.create(attributes)
    found_task = TaskManager.find(task.id)
    assert_equal "This task", found_task.description
    assert_equal "New task", found_task.title
  end

  def test_it_creates_a_task
    attributes = {:description => "This task", :title => "New task"}
    task = TaskManager.create(attributes)

    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end

  def test_it_updates_a_task
    attributes = {:description => "This task", :title => "New task"}
    task1 = TaskManager.create(attributes)
    task1.title = "an updated title"

    TaskManager.update(task1.id, task1)

    assert_equal "This task", task1.description
    assert_equal "an updated title", task1.title
  end

  def test_all_returns_all_tasks
    attributes = {:description => "This task", :title => "New task"}
    TaskManager.create(attributes)
    attributes2 = {:description => "This second task", :title => "New second task"}
    TaskManager.create(attributes2)
    attributes3 = {:description => "This third task", :title => "New third task"}
    TaskManager.create(attributes3)

    all_the_tasks = TaskManager.all

    assert_equal 3, all_the_tasks.size
  end

  def test_it_deletes_a_task
    attributes = {:description => "This task", :title => "New task"}
    task1 = TaskManager.create(attributes)
    attributes2 = {:description => "This second task", :title => "New second task"}
    task2 = TaskManager.create(attributes2)
    attributes3 = {:description => "This third task", :title => "New third task"}
    task3 = TaskManager.create(attributes3)

    all_the_tasks = TaskManager.all

    assert_equal "New task", task1.title
    assert_equal 3, all_the_tasks.size

    TaskManager.delete(task1.id)
    fewer_tasks = TaskManager.all

    assert_equal 2, fewer_tasks.size
  end

end
