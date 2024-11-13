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
call ssh zdw@vps.zengdw.com -p 2222 "cd /data/blog; rm -rf *"

echo *************copy file***************
scp -P 2222 -r ./public/* zdw@vps.zengdw.com:/data/blog/

pause 