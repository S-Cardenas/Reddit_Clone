class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render posts_url
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
