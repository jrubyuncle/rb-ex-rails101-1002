class GroupsController < ApplicationController
  def index
    flash[:notice] = "good morning"
    #flash[:warning] = "this is warning"
    #flash[:my_test] = "my_test"
  end
end
