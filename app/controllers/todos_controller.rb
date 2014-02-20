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
    did_it = Todo.find(params[:id])
    did_it.done = true
    did_it.save
    redirect_to '/'
    # redirect_to "/users/#{:user_id}/todos/#{params(:id)}"
    # respond_to do |format|
    #   if did_it.save
    #     format.js { render layout: false }
    #   end
    # end
  end

  def destroy
    Todo.find(params[:id]).delete
    redirect_to '/'
    # respond_to do |format|
    #   if @todo.delete
    #     format.js { render layout: false }
    #   end
    # end
  end

  def show
  end

  private

    def todo_params
      params.require(:todo).permit(:item, :duedate, :done, :user_id)  
    end
end
