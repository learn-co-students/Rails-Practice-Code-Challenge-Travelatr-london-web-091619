class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)

    @blogger.valid? ? redirect_to(@blogger) : render(:new)
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
