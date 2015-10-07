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
      current_user.join!(@group)
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

  def join
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
      flash[:warning] = "you already have been member"
    else
      current_user.join!(@group)
      flash[:warning] = "join ok"
    end

    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:warning] = "you quit this group"
    else
      flash[:warning] = "you are not member, no need to quit"
    end

    redirect_to group_path(@group)
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
