require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post' do
    describe '#search' do
      before do
        @post = Post.create(
          p_name: "田",
          p_introduction: "広い",
          p_price: 1,
          p_adress: "和歌山県",
          p_menseki: 1.5,
          user_id: 1
        )
        @other_post = Post.create(
          p_name: "畑",
          p_introduction: "狭い",
          p_price: 1,
          p_adress: "東京都",
          p_menseki: 1.5,
          user_id: 2
        )
      end
      context "'和歌山県'で検索した場合" do
        it "@postでは検索できる" do
          expect(Post.search("和歌山県")).to include(@post)
        end

        it "@other_postには出てこない" do
          expect(Post.search("和歌山県")).to_not include(@other_post)
        end
      end

      context "'大阪府'で検索した場合" do
        it '空を返す' do
          expect(Post.search("大阪府")).to be_empty
        end
      end
    end
  end

  context 'Validations' do
    let(:post) { build(:post) }

    it '名前がないと無効である' do
      post.p_name = nil
      expect(post).not_to be_valid
    end

    it 'ユーザーIDがないと無効である' do
      post.user_id = nil
      expect(post).not_to be_valid
    end

    it '住所がないと無効である' do
      post.p_adress = nil
      expect(post).not_to be_valid
    end

    it '紹介文がないと無効である' do
      post.p_introduction = nil
      expect(post).not_to be_valid
    end

    it '農地面積がないと無効である' do
      post.p_menseki = nil
      expect(post).not_to be_valid
    end

    it '月額料金がないと無効である' do
      post.p_price = nil
      expect(post).not_to be_valid
    end
  end
end
