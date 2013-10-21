#!/bin/sh

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
git pull origin $BRANCH
RES=$?
echo "git result: $RES" >> /tmp/deploy.log
$GRUNT deploy
RES=$?
echo "grunt result: $RES" >> /tmp/deploy.log
rm -rf ./_site/*
echo "_site cleaned." >> /tmp/deploy.log
$JEKYLL build
RES=$?
echo "jekyll result: $RES" >> /tmp/deploy.log
