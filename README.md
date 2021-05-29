## アプリケーション名
### 『農ライフ』
## アプリケーション概要
「農ライフ」は、空いている農地を持っている人とその土地で植物や農作物を育てたい人をマッチングするガーデンシェアです。
## URL
[https://farmland.herokuapp.com/](https://farmland.herokuapp.com/)

![demo1](https://user-images.githubusercontent.com/65330638/119956655-466a1600-bfdc-11eb-85f3-d9a6ac4e2495.gif)

## 使い方
- トップページのヘッダーからユーザー登録をする。ログインするとヘッダーから、農地の貸借りができるようになる。
- ヘッダーの「農園を探す」から他のユーザーが貸し出ししている一覧を見ることができ、また、農園名か住所で検索ができる。
- 気になる農園があったらそのページに行き予約ができる。そのページから農園の所有者ページにも飛べる。
- そこでそのユーザーをフォローしたり、メッセージルームに入ってやりとりをすることもできる。
- また、農園を貸したい時はログインした状態でヘッダーから「農園を貸す」から登録できる。

## 使用技術
- Ruby 2.5.3
- Ruby on Rails 5.2.2
- MySQL 5.7
- 本場環境ではPostgres
- AWS S3
- Docker/Docker-compose
- Circle CI/CD(RSpec + Rubocop + heroku自動デプロイ)
## 構成図
<img width="776" alt="PF 環境図" src="https://user-images.githubusercontent.com/65330638/119188209-530add80-bab5-11eb-8db3-d07292a8f15f.png">

#### CircleCi CI/CD

- Githubへのpush時に、RspecとRubocopが自動で実行されます。
- masterブランチへのpushでは、RspecとRubocopが成功した場合、herokuへの自動デプロイが実行されます。
## 機能一覧

- ユーザー登録、ログイン機能(devise)
- 投稿機能 
  - 画像投稿（carrierwave）（rmagick）
- ページネーション機能(kaminari)
- 検索機能
- フォロー機能
- DM機能
- 通知機能（フォロー、DMが来た時）
## テスト

- Rspec
  - 単体テスト（model）
  - 機能テスト（request）
  - 統合テスト（system）
