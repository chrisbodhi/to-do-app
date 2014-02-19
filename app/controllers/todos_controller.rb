class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @todo = Todo.new
    @todos = Todo.where(done: false).where("duedate >= ?", Time.now).to_a
    @done = Todo.where(done: true).to_a
    @overdue = Todo.where(done: false).where("duedate <= ?", Time.now).to_a
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.js { render layout: false }
      end
    end
    # redirect_to '/'
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
