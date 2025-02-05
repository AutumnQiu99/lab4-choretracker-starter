require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:chores)
    should have_many(:children).through(:chores)
  end

  context 'validations' do
    should validate_presence_of(:name)
    
    should validate_numericality_of(:points)
      .only_integer
      .is_greater_than(0)
  end

  context 'scopes' do
    setup do
      Task.destroy_all
      @task1 = Task.create!(name: 'Wash dishes', points: 10, active: true)
      @task2 = Task.create!(name: 'Vacuum', points: 15, active: false)
      @task3 = Task.create!(name: 'Clean room', points: 20, active: true)
    end

    should 'order tasks alphabetically by name' do
      assert_equal [@task3, @task2, @task1], Task.alphabetical
    end

    should 'return only active tasks' do
      assert_equal [@task1, @task3], Task.active
    end
  end
end
