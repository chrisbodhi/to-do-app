class Todo < ActiveRecord::Base
  belongs_to :user
  validates :item, presence: true

  def overdue_days
    ((Time.now - self.duedate)/60/60/24).round
  end

  def self.find_todos(user)
    self.where(user_id: user.id).where(done: false).where("duedate >= ?", Time.now.midnight + 1.day).to_a
  end

  def self.find_todays(user)
    self.where(user_id: user.id).where(done: false).where(duedate: Time.now.midnight..(Time.now.midnight + 1.day)).to_a
  end

  def self.find_overdues(user)
    self.where(user_id: user.id).where(done: false).where("duedate <= ?", Time.now.midnight - 1.day).to_a
  end

  def self.todo_count(user)
    todo_count_array = []
    (1..5).each do |days_ago|
      todo_count_array << self.where(user_id: user.id).where(duedate: Time.now.midnight - days_ago.day).to_a.length
    end
    todo_count_array.reverse
  end

  def self.done_count(user)
    done_count_array = []
    (1..5).each do |days_ago|
      done_count_array << self.where(user_id: user.id).where(done: true).where(updated_at: Time.now.midnight - days_ago.day).to_a.length
    end
    done_count_array.reverse
  end
end
