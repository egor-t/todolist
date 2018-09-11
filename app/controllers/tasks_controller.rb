class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy complete]
  before_action :set_list, only: %i[new create update complete]

  def index
    @tasks = Task.all
  end

  def new
    @list = current_user.lists.find(params[:list_id])
    @task = Task.new
  end

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      flash[:notice] = 'Успешно cоздали задачу.'
      redirect_to list_path @list
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @task.update(task_params)
    flash[:notice] = 'Успешно обновили задачу.'
    redirect_to list_tasks_path
  end
  
  def destroy
    @task.destroy

    redirect_to list_tasks_path
  end

  def complete
    @task.update_attribute(:status, true)
    flash[:notice] = 'Задача завершена.'
    redirect_to list_path @list
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
