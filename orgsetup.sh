#!/bin/sh

CMDNAME=`basename $0`
while getopts a: OPT
do
  case $OPT in
    "a" ) FLG_A="TRUE" ; VALUE_A="$OPTARG" ;;
  esac
done

if [ "$FLG_A" != "TRUE" ]; then
  echo "Usage: $CMDNAME [-a aliasname]" 1>&2
  exit 1
fi

#Salesforce組織の生成
echo "Salesforce組織を生成しています・・・"
sfdx force:org:create -s -f config/project-scratch-def.json -a $VALUE_A

#ソースコードのプッシュ
echo "ソースコードのPushを行なっています・・・"
sfdx force:source:push

#アクセス権限の付与
echo "アクセス権限を付与しています・・・"
sfdx force:user:permset:assign -n NTO

#サンプルデータのインポート
echo "サンプルデータをインポートしています・・・"
sfdx force:data:tree:import -p data/sample-data-plan.json

#Webブラウザの起動
echo "Webブラウザでログインしています・・・"
sfdx force:org:open
