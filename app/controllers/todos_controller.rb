class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.where("done = ? AND duedate >= ?", false, Time.now).to_a
    @done = Todo.where(done: true).to_a
    @overdue = Todo.where("done = ? AND duedate <= ?", false, Time.now).to_a
  end

  def create
    Todo.create(todo_params)
    t = Todo.last
    t.done = false
    t.save
    redirect_to '/'
  end

  def new
  end

  def edit
  end

  def update
    did_it = Todo.find(params[:id])
    did_it.done = true
    did_it.save
    redirect_to '/'
  end

  def destroy
    Todo.find(params[:id]).delete
    redirect_to '/'
  end

  def show
  end

  private

    def todo_params
      params.require(:todo).permit(:item, :duedate, :done)  
    end
end
