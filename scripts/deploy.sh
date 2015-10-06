cd $(dirname $(realpath $0))
cd ../..
mv currency_online/.git _git &&
rm -rf currency_online &&
git clone https://github.com/oprogramador/currency_online.git &&
rm -rf currency_online/.git &&
mv _git currency_online/.git &&
cd currency_online &&
git add --all &&
git commit -m 'update from git' . &&
git push heroku master
