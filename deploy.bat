@echo off
setlocal enabledelayedexpansion

echo *************update******************
git add .
git commit -m "add file"
git pull
git push

echo *************clean*******************
call npx hexo clean

echo *************generate****************
call npx hexo generate

echo *************clean remote folder*****
call ssh zdw@ecs.zengdw.com "cd /usr/local/blog; rm -rf *"

echo *************copy file***************
scp -r ./public/* zdw@ecs.zengdw.com:/usr/local/blog/

pause 