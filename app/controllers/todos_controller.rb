class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = current_user
    @todo = @user.todos.new
    @todos = Todo.where(user_id: @user.id).where(done: false).where("duedate >= ?", Time.now).to_a
    @overdue = Todo.where(user_id: @user.id).where(done: false).where("duedate <= ?", Time.now).to_a
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
    # # This works - don't forget to remove 'remote: true' to reset
    # did_it = Todo.find(params[:id])
    # did_it.done = true
    # did_it.save
    # redirect_to '/'
    ########################
    did_it = Todo.find(params[:id])
    did_it.done = true
    respond_to do |format|
      if did_it.save
        format.js { render layout: false }
      end
    end
  end

  def destroy
    # # This works - don't forget to remove 'remote: true' to reset
    # Todo.find(params[:id]).delete
    # redirect_to '/'
    ########################
    quit = Todo.find(params[:id])
    # Call 'quit.delete' here or in block?
    respond_to do |format|
      if quit.delete
        format.js { render layout: false }
      end
    end
  end

  def show
  end

  private

    def todo_params
      params.require(:todo).permit(:item, :duedate, :done, :user_id)  
    end
end
