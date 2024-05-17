class TasksController < ApplicationController
  def index
    @current_user = User.find_by({ "id" => session["user_id"] })
    # @tasks = Task.all
    @tasks = Task.where({ "user_id" => @current_user["id"] })
  end

  def create
    @current_user = User.find_by({ "id" => session["user_id"] })

    @task = Task.new
    @task["description"] = params["description"]
    @task["user_id"] = @current_user["id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
