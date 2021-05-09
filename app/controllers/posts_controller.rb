class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      p_name: params[:p_name],
      p_adress: params[:p_adress],
      p_menseki: params[:p_menseki],
      p_price: params[:p_price],
      p_introduction: params[:p_introduction],
      p_image: params[:p_image]
    )
    if @post.save
      flash[:notice] = "あなたの農園を登録しました！"
      redirect_to("posts/index")
    else
      redirect_to("/posts")
    end
  end
end
