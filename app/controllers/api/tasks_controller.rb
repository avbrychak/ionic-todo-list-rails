class Api::TasksController < ApplicationController

  before_action :set_list
  before_action :set_task, except: [:create]

  def create
    @task = @list.tasks.create!(task_params)
    render json: @task, status: :created
  end

  def destroy
    @task.destroy
    head 204
  end

  def complete
    @task.update_attributes(completed_at: Time.now, completed: true)
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
    params[:task].permit(:name)
  end
end
