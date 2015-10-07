class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_group

  def new
    @post = @group.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to group_path(@group), notice: 'create post ok'
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group), notice: 'update post ok'
    else
      render :update
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = current_user.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), alert: 'post destroyed'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
