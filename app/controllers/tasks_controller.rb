class TasksController < ApplicationController
  # before_action :find_task, only: [:show, :status]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

    if @task.completed == true
      @status = "This task is completed"
    else
      @status = "This task is not completed yet"
    end
  end

  def new
    @task = Task.new # Needed for form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
