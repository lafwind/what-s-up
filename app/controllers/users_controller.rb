class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @groups = Group.where(user_id: @user.id).order("created_at DESC")
    @posts = Post.where(user_id: @user.id).order("created_at DESC")
  end
end
