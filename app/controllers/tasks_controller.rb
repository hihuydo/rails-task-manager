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

  # CREATE: STEP 1 (GET)
  def new
    @task = Task.new # Needed for form_for
  end

  # CREATE: STEP 1 (POST)
  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  # UPDATE: STEP 1 (GET)
  def edit
    @task = Task.find(params[:id])
  end

  # UPDATE: STEP 2 (POST)
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
