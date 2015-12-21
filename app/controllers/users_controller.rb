class UsersController < ApplicationController

  before_action :find_user, only: [ :show, :groups, :posts ]
  before_action :find_groups, only: [ :show, :groups ]

  def show
  end

  def groups
    render :show
  end

  def posts
    @posts = User.posts(@user).paginate(page: params[:page], per_page: 5)
    render :show
  end

  private

    def find_user
        @user = User.find(params[:id])
    end

    def find_groups
      @groups = User.groups(@user)
    end
end
