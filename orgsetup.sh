#!/bin/sh

CMDNAME=`basename $0`
while getopts ab:c: OPT
do
  case $OPT in
    "c" ) FLG_C="TRUE" ; VALUE_C="$OPTARG" ;;
      * ) echo "Usage: $CMDNAME [-c aliasname]" 1>&2
          exit 1 ;;
  esac
done

sfdx force:org:create -s -f config/project-scratch-def.json -a $VALUE_C
sfdx force:source:push
sfdx force:user:permset:assign -n NTO
sfdx force:data:tree:import -p data/sample-data-Merchandise__c-plan.json
sfdx force:org:open
