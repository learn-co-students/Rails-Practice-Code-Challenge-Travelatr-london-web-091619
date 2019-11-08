class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.update(likes: 0) # likes should really default to 0 in the schema

    @post.valid? ? redirect_to(@post) : render(:new)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    @post.valid? ? redirect_to(@post) : render(:edit)
  end

  def show
    @post = Post.find(params[:id])
  end

  def increment_likes
    @post = Post.find(params[:id])
    @post.update(likes: @post.likes += 1)
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
  end
end
