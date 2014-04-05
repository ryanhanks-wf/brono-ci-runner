mkdir ~/.pip 
echo "[global]
timeout = 15
index-url = https://ryanhanks-wf:e789c9a2a4@pypi.webfilings.org/simple/" > ~/.pip/pip.conf 
mkdir .ssh
cd .ssh/
ssh-keygen -t rsa -C "ryan.hanks@webfilings.com"
ssh-add ~/.ssh/id_rsa
cat https://github.com/settings/ssh
say "open github ssh key page and press ctrl d"
cat
pbcopy < ~/.ssh/id_rsa.pub
cat https://github.com/settings/ssh
say "add ssh key"
cat
ssh -T git@github.com
date
# xcode-select --install
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew install node cmake python ant jenkins
pip install virtualenv
 
 
npm install -g grunt-cli
npm install -g cordova
npm install -g phantomjs
 
git clone git@github.com:ryanhanks-wf/bdub

cd bdub

sudo gem install bundler
sudo bundle

sudo pmset sleep 90

bundle exec soloist


