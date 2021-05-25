require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe '#create,#destroy' do
    it 'ユーザーをフォロー、フォロー解除できる' do
      login(@user1)

      visit user_path(@user2)

      find('input[name = "commit"]').click
      expect(page).to have_content "ユーザーをフォローしました"
      expect(@user2.followers.count).to eq(1)
      expect(@user1.followings.count).to eq(1)

      find('input[name = "commit"]').click
      expect(page).to have_content "ユーザーのフォローを解除しました"
      expect(@user2.followers.count).to eq(0)
      expect(@user1.followings.count).to eq(0)
    end
  end
end
