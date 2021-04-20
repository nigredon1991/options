# npm install -g asar
mkdir ~/tmp/slack
asar extract /usr/lib/slack/resources/app.asar ~/tmp/slack
sed -i 's/unreads>0/unreads<0/g' ~/tmp/slack/dist/main.*.js
sudo rm /usr/lib/slack/resources/app.asar
sudo rm -rf /usr/lib/slack/resources/app.asar.unpacked
sudo asar pack ~/tmp/slack /usr/lib/slack/resources/app.asar
rm -rf ~/tmp/slack
