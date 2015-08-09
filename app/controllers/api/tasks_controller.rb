class Api::TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, except: [:create, :index]

  def index
    render json: @list.tasks
  end

  def create
    @task = @list.tasks.create!(task_params)
    render json: @task, status: :created
  end

  def destroy
    @task.destroy
    head 204
  end

  def set_priority
    @task.update_attributes(target_priority: task_params[:target_priority])
    render json: @task, message: "Priority changed successfully"
  end

  def complete
    @task.update_attributes(completed_at: Time.now, completed: task_params[:completed])
    render json: @task, message: "Todo item completed"
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:name, :completed, :target_priority)
  end
end
