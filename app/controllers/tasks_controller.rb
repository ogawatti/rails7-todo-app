class TasksController < ApplicationController
  def index
    @tasks = Task.page(1).page(params[:page])
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created." }
      else
        format.html { redirect_to tasks_url, alert: @task.errors.full_messages.first }
      end
    end
  end

  def update
    respond_to do |format|
      if task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated." }
      else
        format.html { redirect_to tasks_url, alert: task.errors.full_messages.first }
      end
    end
  end

  def destroy
    task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, status: :see_other, notice: "Task was successfully destroyed." }
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
