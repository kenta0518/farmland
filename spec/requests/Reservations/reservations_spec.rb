require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  let(:user) { create(:user) }

  describe "予約後のページに接続できる" do
    it "予約の確認に接続できる" do
      sign_in user
      get reservations_path(user)
      expect(response).to have_http_status(200)
    end

    it "貸し予定の画面に接続できる" do
      sign_in user
      get lend_path
      expect(response).to have_http_status(200)
    end
  end
end
