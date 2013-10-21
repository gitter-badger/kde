#!/bin/sh

export LC_ALL=zh_TW.UTF-8

GRUNT=/usr/local/bin/grunt
JEKYLL=/usr/local/bin/jekyll

if [ -z "$1" ]; then
	# default path
	TARGET=/opt/KDE-Taiwan/kde
else
	TARGET=$1
fi

if [ -z "$2" ]; then
	# default branch to master
	BRANCH=master
else
	BRANCH=$2
fi

cd $TARGET
echo "cd $TARGET to pull $BRANCH" >> /tmp/deploy.log
git pull origin $BRANCH >> /tmp/deploy.log 2>&1
RES=$?
echo "git result: $RES.  Running $GRUNT deploy" >> /tmp/deploy.log
$GRUNT deploy >> /tmp/deploy.log 2>&1
RES=$?
echo "grunt result: $RES" >> /tmp/deploy.log
rm -rf ./_site/*
echo "_site cleaned. Running $JEKYLL build" >> /tmp/deploy.log
$JEKYLL build >> /tmp/deploy.log 2>&1
RES=$?
echo "jekyll result: $RES" >> /tmp/deploy.log
echo "Done. What's the result?" >> /tmp/deploy.log
