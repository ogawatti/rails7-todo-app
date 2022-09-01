class TasksController < ApplicationController
  def index
    @tasks = Task.page(1).page(params[:page])
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

    redirect_to tasks_path, status: :see_other
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.fetch(:task, {}).permit(:content, :done)
  end
end
