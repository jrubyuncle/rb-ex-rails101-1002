class PostsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @post = @group.posts.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.create(post_params)

    if @post.save
      redirect_to group_path(@group), notice: 'create post ok'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
