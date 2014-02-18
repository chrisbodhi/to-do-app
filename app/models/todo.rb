class Todo < ActiveRecord::Base

  def display_overdue
    unless self.done
      self if self.duedate.day < Time.now.day
    end
  end
end
