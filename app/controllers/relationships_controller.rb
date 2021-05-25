class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
    redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = 'ユーザーのフォローを解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
