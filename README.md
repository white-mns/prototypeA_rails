# Prototype-A　表示用Railsアプリ
このプログラムは定期更新ゲームの戦闘結果のようなものの出力を受け取り表示します。  
戦闘結果生成部分については[別リポジトリ](https://github.com/white-mns/prototypeA_cpp)を参照ください。

# サイト
現時点で公開しているサイトはありません。 

# 動作環境
以下の環境での動作を確認しています  
  
OS:CentOS release 6.5 (Final)  
DB:MySQL 8.0.13
Ruby:2.5.0  
Rails:5.2.1  
gcc:7.3.1

## 使い方
・Railsの使い方を調べてなんやかんやして自分のRailsアプリが動くようにします。  
・このソースコードをダウンロードします。  

    git clone git://github.com/white-mns/prototypeA_rails.git

・[戦闘結果生成プログラム](https://github.com/white-mns/prototypeA_cpp)をコンパイルした実行ファイルを`vendor/buttle_start`にリンクします。 
（リンク例：/var/cppに該当リポジトリをクローンした場合）

    ln -s /var/cpp/prototypeA_cpp/main vendor/battle_start

・動かします。  

    cd prototypeA_rails
    bundle install --path vendor/bundler
（Gemのインストール先をアプリのディレクトリ内のvendor/bundleに指定します。  
　この指定はなくても構いません。既に`.bundle`内に該当設定が指定されています）
 
・DBを作成し、必要なテーブルの設定を行います。
 
    bundle exec rake db:create
    bundle exec rake db:migrate
    ./unicorn start
    
他の方法でRailsが動かせる場合、Unicornである必要はありません。  
デフォルトの設定だと`http://サーバーのアドレス:61000`で画面が見れます。

## 動かない場合
・権限が足りない  
・Cのコンパイラ等が古い  
などの可能性が考えられます。

### 権限が足りない
所有者をユーザーapache、グループusersにします。

    chown -R apache:users ./
  
そして、編集しやすくするために等で普段使うユーザーをusersに追加します。

    usermod -aG グループ名 ユーザー名
    
ユーザーがグループに所属していたら書き込みできるようにします。  
グループへの権限追加なのでセキュリティ的にも問題はないと思っています。

    chmod g+w ./ -r

### Cのコンパイラ等が古い

gcc 4.4.7では一部のgemのインストールがうまくいきませんでした。  
5.2.1に上げれば動作することを確認しています。

開発環境ではCentOSを使っているので、[Developer Toolset 7 &mdash; Software Collections](https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/)でgccのバージョンを上げました。

## ライセンス
本ソフトウェアはMIT Licenceを採用しています。 ライセンスの詳細については`LICENSE`ファイルを参照してください。
