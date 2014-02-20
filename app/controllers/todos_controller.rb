class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = current_user
    @todo = @user.todos.new
    @todos = Todo.find_todos(@user)
    @overdue = Todo.find_overdues(@user)
    @done = User.find_done(@user)
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.js { render layout: false }
      end
    end
  end

  def new
  end

  def edit
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.done = true
    @user = current_user
    @done = User.find_done(@user)
    respond_to do |format|
      if @todo.save
        format.js { render layout: false }
      end
    end
  end

  def destroy
    @user = current_user
    @todos = Todo.find_todos(@user)
    @todo = Todo.destroy(params[:id])
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def show
  end

  private

    def todo_params
      params.require(:todo).permit(:item, :duedate, :done, :user_id)  
    end
end
