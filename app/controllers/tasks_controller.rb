class TasksController < ApplicationController
  # before_action :find_task, only: [:show, :status]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

    if @task.completed == true
      @test = "This task is completed"
    else
      @test = "This task is not completed yet"
    end
  end

  # private

  # def find_task
  #   # @task = Task.find(params[:id])
  # end
end
