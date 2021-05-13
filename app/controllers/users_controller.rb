class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  private

  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
