class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :judge_user, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "Create successfully~~"
    else
      flash.now[:alert] = "Something wrong here!!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Update successfully~~"
    else
      flash.now[:alert] = "Something wrong here!!"
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def like
    @post.liked_by current_user
    redirect_to :back
  end

  private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :url, :description)
    end

    def judge_user
      find_post
      if @post.user_id != current_user.id
        redirect_to root_path
      end
    end
end
