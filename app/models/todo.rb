class Todo < ActiveRecord::Base
  belongs_to :user

  def overdue_days
    ((Time.now - self.duedate)/60/60/24).round
  end
end
