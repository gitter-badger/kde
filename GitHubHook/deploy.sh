#!/bin/sh

cd $1
echo "cd $1 to pull $2" >> /tmp/deploy.log
git pull origin $2
/usr/local/bin/grunt deploy
rm -rf ./_site/*
/usr/local/bin/jekyll build
