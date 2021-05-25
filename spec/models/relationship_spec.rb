require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    @relationship = @user.follow(@another_user)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with follower_id, followed_id' do
        expect(@relationship).to be_valid
      end
    end

    context 'unsuccessfully' do
      it '友達申請する側の値（user_id）がなければ保存できない。' do
        @relationship.user_id = ''
        @relationship.valid?
        expect(@user.followers.count).to eq(0)
        expect(@another_user.followings.count).to eq(0)
      end

      it '友達申請される側の値（follow_id）がなければ保存できない。' do
        @relationship.follow_id = ''
        @relationship.valid?
        expect(@user.followers.count).to eq(0)
        expect(@another_user.followings.count).to eq(0)
      end
    end
  end
end
