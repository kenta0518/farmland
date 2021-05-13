class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new; end

  def create
    @post = Post.new(
      p_name: params[:p_name],
      p_adress: params[:p_adress],
      p_menseki: params[:p_menseki],
      p_price: params[:p_price],
      p_introduction: params[:p_introduction],
      p_image: params[:p_image],
      user_id: current_user.id
    )
    if @post.save
      flash[:notice] = "あなたの農園を登録しました！"
      redirect_to("/posts")
    else
      redirect_to("/")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.p_name = params[:p_name]
    @post.p_adress = params[:p_adress]
    @post.p_menseki = params[:p_menseki]
    @post.p_price = params[:p_price]
    @post.p_introduction = params[:p_introduction]
    if @post.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/")
    else
      render "posts/:id/edit"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end

  private

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
end
