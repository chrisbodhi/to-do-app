class Todo < ActiveRecord::Base
  belongs_to :user

  def overdue_days
    ((Time.now - self.duedate)/60/60/24).round
  end

  def self.find_todos(user)
    self.where(user_id: user.id).where(done: false).where("duedate >= ?", Time.now).to_a
  end

  def self.find_overdues(user)
    self.where(user_id: user.id).where(done: false).where("duedate <= ?", Time.now).to_a
  end
end
