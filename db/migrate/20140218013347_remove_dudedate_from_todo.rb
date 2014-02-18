class RemoveDudedateFromTodo < ActiveRecord::Migration
  def change
    remove_column :todos, :dudedate, :datetime
    add_column :todos, :duedate, :datetime
  end
end
