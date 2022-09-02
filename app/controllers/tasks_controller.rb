class TasksController < ApplicationController
  def index
    @tasks = Task.search(params[:q]).page(params[:page])
  end

  def create
    @task = Task.new(task_params)

    unless @task.save
      redirect_to tasks_path
    end
  end

  def update
    unless task.update(task_params)
      redirect_to tasks_path
    end
  end

  def destroy
    task.destroy
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.fetch(:task, {}).permit(:content, :done)
  end
end
