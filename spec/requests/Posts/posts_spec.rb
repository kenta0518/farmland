require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    sign_in user
  end

  describe "Post#new" do
    it "予約の確認に接続できる" do
      sign_in user
      get new_post_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post#show' do
    it '特定のpostを取得する' do
      @user = User.create(
        username: "test",
        email: "TEST@example.com",
        password: "password",
        password_confirmation: "password",
        id: 1
      )
      @post = Post.create(
        p_name: "田",
        p_introduction: "広い",
        p_price: 1,
        p_adress: "和歌山県",
        p_menseki: 1.5,
        user_id: 1
      )
      get "/posts/#{@post.id}"
      expect(response.status).to eq(200)
      expect(response.body).to include @post.p_name
    end
  end

  describe 'Post#destloy' do
    before do
      @post = Post.create(
        p_name: "田",
        p_introduction: "広い",
        p_price: 1,
        p_adress: "和歌山県",
        p_menseki: 1.5,
        user_id: 1
      )
    end
    it 'ログインしていないユーザーは削除できないこと' do
      expect { delete "/posts/#{@post.id}" }.to change { Post.count }.by(0)
      expect(response).to have_http_status "302"
    end
  end
end
