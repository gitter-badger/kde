#!/bin/sh

cd $1
git pull origin $2
grunt deploy
