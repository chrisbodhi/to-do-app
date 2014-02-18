class Todo < ActiveRecord::Base

  def display_overdue
    unless self.done
      return self if self.duedate.day < Time.now.day
    end
  end
end
