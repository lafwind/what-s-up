class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment =  @post.comments.new(params.require(:comment).permit(:content))
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Comment successfully!"
      redirect_to :back
    else
      flash.now[:alert] = "Some error!"
      render "posts/show"
    end
  end
end
