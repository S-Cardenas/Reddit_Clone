class SubsController < ApplicationController

  before_action :check_moderator, only: [:edit, :update]
  before_action :require_user!, except: [:show, :index]

  def index
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)   #<------ ########COMMON TRICK!!!
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def check_moderator
    @sub = Sub.find(params[:id])
    redirect_to sub_url(@sub) unless @sub.moderator_id == current_user.id
  end

end
