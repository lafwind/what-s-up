class GroupsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :judge_user, only: [:new, :create, :show, :edit, :update, :destroy]

  def show
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to user_group_path(current_user, @group), notice: "Successful!"
    else
      flash.now[:alert] = "some error(s) = ="
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to user_group_path(current_user, @group)
    else
      flash.now[:alert] = "some error(s) = ="
      render 'new'
    end
  end

  def destroy
    @group.destroy
    redirect_to user_path(current_user)
  end

  private

    def group_params
        params.require(:group).permit(:name, :description)
    end

    def find_group
      # @group = Group.where(id: params[:id], user_id: params[:user_id]).first
      @group = Group.find(params[:id])
    end

    def judge_user
      if params[:user_id] != current_user.id || find_group.user_id != current_user.id
        redirect_to root_path
      end
    end
end
