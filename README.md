## ノーザントレイルアウトフィッターズ サンプルアプリケーション

[オリジナルのリポジトリ](https://github.com/ccoenraets/northern-trail)の日本語版になります。

### 利用方法

以下の手順でデプロイが可能です

1. SFDX CLIでDevHub組織へログイン
```
sfdx force:auth:web:login -d
```
1. northern-trailリポジトリのクローン:
    ```
    git clone https://github.com/mokamoto/northern-trail
    cd northern-trail
    ```
1. エイリアス(nto)をつけたScrach Orgの作成
```
sfdx force:org:create -s -f config/project-scratch-def.json -a nto
```
1. ソースコードのPush
```
  sfdx force:source:push
```
1. 権限セットのアサイン
```
  sfdx force:user:permset:assign -n NTO
```
1. データのインポート
```
  sfdx force:data:tree:import -p data/sample-data-plan.json
```  
1. Webブラウザを表示して確認
```
sfdx force:org:open
```
1. **販売セット構成** タブをクリックし, 販売セット構成をクリックします

1. 商品を右のサイドバーから販売セット構成にドラッグ & ドロップします

1. Pathコンポーネントの **製造部門へ送信済み** をクリックします

[ノーザントレイル製造](https://github.com/mokamoto/northern-trail-manufacturing)　サンプルアプリをインスツトールする事で、Platform Eventベースのインテグレーションを確認できます。

SFDX を使ってデプロイしたい場合は以下のコマンドを使用します:

[![Deploy](https://deploy-to-sfdx.com/dist/assets/images/DeployToSFDX.svg)](https://deploy-to-sfdx.com/deploy?template=https://github.com/mokamoto/northern-trail)
