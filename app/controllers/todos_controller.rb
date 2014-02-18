class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    Todo.create(todo_params)
    redirect_to '/'
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

    def todo_params
      params.require(:todo).permit(:item, :duedate)  
    end
end
