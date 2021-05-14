RSpec.describe "Sessions", type: :request do
  describe 'GET #edit' do
    subject { get edit_user_registration_path }
    context 'ログインしている場合' do
      let(:user) { create(:user) }
      it 'リクエストが成功すること' do
        sign_in user
        is_expected.to eq 200
      end
    end
    context 'ゲストの場合' do
      it 'リダイレクトされること' do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #show' do
    subject { get user_path }
    context 'ユーザーが存在しない場合' do
      let(:user) { create(:user) }
      it 'エラーが発生すること' do
        sign_in user
        user_id = user.id
        user.destroy
        expect { get "/users/#{user_id}" }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
