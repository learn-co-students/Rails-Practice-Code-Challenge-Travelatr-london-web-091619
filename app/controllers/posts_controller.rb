class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post =Post.new
  end

  def create
    @post = Post.new(post_params(:title, :content, :blogger_id, :destination_id))

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params(:title, :content, :blogger_id, :destination_id))
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  private

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
