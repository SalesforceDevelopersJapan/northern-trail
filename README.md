## ノーザントレイルアウトフィッターズ サンプルアプリケーション

[オリジナルのリポジトリ](https://github.com/ccoenraets/northern-trail)の日本語版になります。

### 利用方法

以下の手順でデプロイが可能です

1. SFDX CLIでDevHub組織へログイン
```
sfdx force:auth:web:login -d
```
1. Scrach Orgの作成
```
sfdx force:org:create -s -f config/project-scratch-def.json -a devorg1
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
