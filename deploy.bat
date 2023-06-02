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
call ssh root@vpn.zengdewan.com "cd /usr/local/blog; rm -rf *"

echo *************copy file***************
scp -r ./public/* root@vpn.zengdewan.com:/usr/local/blog/

pause