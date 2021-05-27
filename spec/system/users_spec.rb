require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit new_user_registration_path
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_username', with: 'test'
            fill_in 'user_password', with: 'password'
            fill_in 'user_password_confirmation', with: 'password'
            click_button 'アカウントを作成'
            expect(current_path).to eq root_path
            expect(page).to have_content 'アカウント登録が完了しました。'
          end
        end
        context 'メールアドレス未記入' do
          it 'ユーザーの新規作成が失敗' do
            visit new_user_registration_path
            fill_in 'user_email', with: nil
            fill_in 'user_username', with: 'test'
            fill_in 'user_password', with: 'password'
            fill_in 'user_password_confirmation', with: 'password'
            click_button 'アカウントを作成'
            expect(current_path).to eq user_registration_path
            expect(page).to have_content "Eメールを入力してください"
          end
        end
        context '登録済メールアドレス' do
          it 'ユーザーの新規作成が失敗する' do
            visit new_user_registration_path
            fill_in 'user_email', with: user.email
            fill_in 'user_username', with: 'test'
            fill_in 'user_password', with: 'password'
            fill_in 'user_password_confirmation', with: 'password'
            click_button 'アカウントを作成'
            expect(current_path).to eq user_registration_path
            expect(page).to have_content "Eメールはすでに存在します"
          end
        end
      end
    end
    describe 'ログイン後' do
      before { login(user) }
      describe 'ユーザー編集' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの編集が成功' do
            visit edit_user_registration_path(user)
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password', with: 'newpassword'
            fill_in 'user_password_confirmation', with: 'newpassword'
            fill_in 'user_current_password', with: 'password'
            click_button '変更する'
            expect(current_path).to eq root_path
            expect(page).to have_content 'アカウント情報を変更しました。'
          end
        end
        context 'メールアドレス未記入' do
          it 'ユーザーの編集が失敗' do
            visit edit_user_registration_path(user)
            fill_in 'user_email', with: nil
            fill_in 'user_password', with: 'newpassword'
            fill_in 'user_password_confirmation', with: 'newpassword'
            fill_in 'user_current_password', with: 'password'
            click_button '変更する'
            expect(current_path).to eq user_registration_path
            expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした'
          end
        end
      end
    end
  end
end
