class GroupsController < ApplicationController
  def index
    flash[:notice] = "good morning"
    #flash[:warning] = "this is warning"
    #flash[:my_test] = "my_test"
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
      #redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
