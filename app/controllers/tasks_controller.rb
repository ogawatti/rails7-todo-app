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
    respond_to do |format|
      if task.update(task_params)
        format.html { render :show }
      else
        format.html { redirect_to tasks_path }
      end
    end
  end

  def destroy
    task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other }
    end
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.fetch(:task, {}).permit(:content, :done)
  end
end
