class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Create successfully~~"
    else
      render 'new', notice: "Something wrong here!!"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Update successfully~~"
    else
      render 'edit', notice: "Something wrong here!!"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :url, :description)
    end
end
