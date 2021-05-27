require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  describe 'DMのテスト' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      login(@user1)
      visit user_path(@user2)
    end

    context '表示の確認' do
      it 'メッセージボタンがある' do
        find('input[name = "f_commit"]').click
      end

      it 'メッセージルームに入れる' do
        find('input[name = "f_commit"]').click
        expect(page).to have_content 'メッセージルーム'
      end
    end

    context 'メッセージルーム内' do
      it 'メッセージルームに入れる' do
        find('input[name = "f_commit"]').click
        expect(page).to have_content 'メッセージルーム'
      end

      it 'チャットルームに入ることができ、送信フォームが表示される' do
        find('input[name = "f_commit"]').click
        expect expect(page).to have_field 'メッセージを入力して下さい'
      end

      it 'メッセージを送信できる' do
        find('input[name = "f_commit"]').click
        fill_in 'メッセージを入力して下さい', with: 'テストメッセージ'
        click_button '投稿する'
        expect(page).to have_content 'テストメッセージ'
      end
    end

    context 'メッセージをもらった側のユーザー' do
      it 'マイページに通知が表示される' do
        find('input[name = "f_commit"]').click
        fill_in 'メッセージを入力して下さい', with: 'テストメッセージ'
        click_button '投稿する'
        click_on 'ログアウト'
        login(@user2)
        visit user_path(@user2)
        expect(page).to have_content '未既読の通知があります。'
      end

      it 'リンクから通知一覧画面に遷移でき、メッセージの受信が確認できる' do
        find('input[name = "f_commit"]').click
        fill_in 'メッセージを入力して下さい', with: 'テストメッセージ'
        click_button '投稿する'
        click_on 'ログアウト'
        login(@user2)
        visit user_path(@user2)
        click_on '未既読の通知があります。'
        expect(page).to have_content '通知一覧'
        expect(page).to have_content 'あなたにDMを送りました。'
      end

      it 'チャットルームに入ることができ、受け取ったメッセージが表示される' do
        find('input[name = "f_commit"]').click
        fill_in 'メッセージを入力して下さい', with: 'テストメッセージ'
        click_button '投稿する'
        click_on 'ログアウト'
        login(@user2)
        visit user_path(@user1)
        click_on 'メッセージ'
        expect expect(page).to have_content 'テストメッセージ'
      end

      it 'メッセージを返信できる' do
        find('input[name = "f_commit"]').click
        fill_in 'メッセージを入力して下さい', with: 'テストメッセージ'
        click_button '投稿する'
        click_on 'ログアウト'
        login(@user2)
        visit user_path(@user1)
        click_on 'メッセージ'
        fill_in 'メッセージを入力して下さい', with: 'テストメッセージへの返信'
        click_button '投稿する'
        expect(page).to have_content 'テストメッセージへの返信'
      end
    end
  end
end
