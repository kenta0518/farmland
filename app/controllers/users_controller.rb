class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @currentuserentry = Entry.where(user_id: current_user.id)
    @userentry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentuserentry.each do |cu|
        @userentry.each do |u|
          if cu.room_id == u.room_id
            @isroom = true
            @roomid = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
