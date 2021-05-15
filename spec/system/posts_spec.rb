require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  let(:user) { create(:user) }
  describe 'posts#create' do
    context '画像やテキストを投稿できる' do
      before { login(user) }
      it 'ログインユーザーは投稿できる、indexページで表示されている' do
        click_on '農園を貸す'
        visit new_post_path
        fill_in 'p_name', with: 'test'
        fill_in 'p_adress', with: '和歌山県'
        fill_in 'p_menseki', with: '100'
        fill_in 'p_price', with: '100000'
        fill_in 'p_introduction', with: 'なんでも植えられます'
        attach_file('p_image', File.join(Rails.root, '/spec/support/fixtures/test.jpg'))
        click_button '登録'
        expect(current_path).to eq posts_path
        expect(page).to have_content('あなたの農園を登録しました！')
        expect(page).to have_content('test')
        expect(page).to have_content('和歌山県')
        expect(page).to have_content('100')
        expect(page).to have_content('100000')
      end
    end
    context '画像やテキストが投稿できない' do
      it 'ログインしていない場合は投稿のページへはいけない' do
        visit root_path
        expect(page).to have_no_content('農園を貸す')
      end
    end
  end
  describe 'posts#edit' do
    context '投稿ページを編集できる' do
      before { login(user) }
      it 'post#edit' do
        click_on '農園を貸す'
        visit new_post_path
        fill_in 'p_name', with: 'test'
        fill_in 'p_adress', with: '和歌山県'
        fill_in 'p_menseki', with: '100'
        fill_in 'p_price', with: '100000'
        fill_in 'p_introduction', with: 'なんでも植えられます'
        attach_file('p_image', File.join(Rails.root, '/spec/support/fixtures/test.jpg'))
        click_button '登録'
        expect(current_path).to eq posts_path
        click_on 'マイページ'
        expect(current_path).to eq user_path(user)
        click_on '編集'
        expect(page).to have_field 'p_name', with: 'test'
        expect(page).to have_field 'p_adress', with: '和歌山県'
        expect(page).to have_field 'p_menseki', with: '100.0'
        expect(page).to have_field 'p_price', with: '100000'
        expect(page).to have_field 'p_introduction', with: 'なんでも植えられます'
        fill_in 'p_name', with: 'test1'
        fill_in 'p_adress', with: '和歌山県1'
        fill_in 'p_menseki', with: '1001'
        fill_in 'p_price', with: '1000001'
        fill_in 'p_introduction', with: 'なんでも植えられます1'
        click_on '変更'
        expect(current_path).to eq root_path
        expect(page).to have_content '情報を更新しました'
        click_on 'マイページ'
        expect(page).to have_content('test1')
        expect(page).to have_content('和歌山県1')
        expect(page).to have_content('1001.0')
        expect(page).to have_content('1000001')
      end
    end
  end
end
