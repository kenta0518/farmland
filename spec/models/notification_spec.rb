require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "#create" do
    context "ダイレクトメッセージ関連の通知" do
      it "ダイレクトメッセージが行われた場合に保存できる" do
        room = build(:room)
        message = build(:message)
        notification = build(:notification, room_id: room.id, message_id: message.id, action: "dm")
        expect(notification).to be_valid
      end
    end

    context "フォロー関連の通知" do
      it "フォローが行われた場合に保存できる" do
        @user1 = build(:user)
        @user2 = build(:user)
        notification = build(:notification, visitor_id: @user1.id, visited_id: @user2.id, action: "follow")
        expect(notification).to be_valid
      end
    end
  end

  describe "アソシエーションのテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Messageモデルとのアソシエーション" do
      let(:target) { :message }

      it "Messageとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "Roomモデルとのアソシエーション" do
      let(:target) { :room }

      it "Roomとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "visitorとのアソシエーション" do
      let(:target) { :visitor }

      it "Visitorとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "visitedとのアソシエーション" do
      let(:target) { :visited }

      it "Visitedとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
