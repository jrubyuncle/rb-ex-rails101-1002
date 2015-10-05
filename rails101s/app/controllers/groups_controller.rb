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
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
