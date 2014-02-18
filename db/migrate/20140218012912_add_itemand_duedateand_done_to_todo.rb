class AddItemandDuedateandDoneToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :item, :text
    add_column :todos, :dudedate, :datetime
    add_column :todos, :done, :boolean
  end
end
