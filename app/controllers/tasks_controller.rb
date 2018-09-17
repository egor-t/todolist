class TasksController < ApplicationController
  include TasksHelper
  before_action :set_task, only: %i[show edit update destroy complete]
  before_action :set_list, only: %i[create new]

  def index
    @tasks = Task.active
  end

  def new
    # @list = current_user.lists.find(params[:list_id])
    @task = Task.new
  end

  def create
    @task = @list.tasks.create(task_params)
    if @task.valid?
      flash[:notice] = 'Успешно cоздали задачу.'
      redirect_to all_tasks_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Успешно обновили задачу.'
      redirect_to all_tasks_path
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy

    redirect_to all_tasks_path
  end

  def complete
    @task.update_attribute(:status, true)
    flash[:notice] = 'Задача завершена.'
    redirect_to all_tasks_path
  end

  def archive
    @tasks = Task.archived
  end

  def today
    @tasks = Task.today
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :description, :date, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end
end
