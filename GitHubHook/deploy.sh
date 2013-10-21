#!/bin/sh

cd $1
echo "cd $1 to pull $2" >> /tmp/deploy.log
git pull origin $2
RES=$?
echo "git result: $RES" >> /tmp/deploy.log
/usr/local/bin/grunt deploy
RES=$?
echo "grunt result: $RES" >> /tmp/deploy.log
rm -rf ./_site/*
echo "_site cleaned." >> /tmp/deploy.log
/usr/local/bin/jekyll build
RES=$?
echo "jekyll result: $RES" >> /tmp/deploy.log
