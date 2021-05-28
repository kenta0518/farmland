class HomeController < ApplicationController
  def top
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |u|
      u.password = SecureRandom.urlsafe_base64
      u.username = "ゲストユーザー"
      u.profile = '私はゲストユーザーです'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
