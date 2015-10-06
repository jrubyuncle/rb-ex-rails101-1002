class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    flash[:notice] = "good morning"
    #flash[:warning] = "this is warning"
    #flash[:my_test] = "my_test"
    @groups = Group.all
  end

  def show
    @group = current_user.groups.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path
      #redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'update ok'
    else
      render :update
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: 'this group is deleted'
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
