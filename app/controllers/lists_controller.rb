class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:notice] = 'Успешно cоздали список.'
      redirect_to lists_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @list.update(list_params)
    flash[:notice] = 'Успешно обновили список.'
    redirect_to lists_path
  end
  
  def destroy
    @list.destroy

    redirect_to lists_path
  end
  
  private

  def list_params
    params.require(:list).permit(:title)
  end
  
  def set_list
    @list = current_user.lists.find(params[:id])
  end
end
