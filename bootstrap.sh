echo "https://github.com/settings/ssh" | pbcopy
echo "**************************************************"
echo "1. open https://github.com/settings/ssh (in your pasteboard) and continue"

xcode-select --install

mkdir ~/.ssh
cd ~/.ssh/
ssh-keygen -t rsa -C "ryan.hanks@webfilings.com"
cat
ssh-add ~/.ssh/id_rsa
cd

cat
pbcopy < ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub
say "add the key"
echo "**************************************************"
echo "2. Add the key and press ctrl+d to continue"
cat

ssh -T git@github.com
cat
cd ~/
git clone git@github.com:ryanhanks-wf/brony-ci-runner
echo "**************************************************"
echo "press ctrl+d when xcode install completes"
cat

cd ~/brony-ci-runner
sudo gem install bundler
sudo bundle
bundle exec soloist
