echo "https://github.com/settings/ssh" | pbcopy
echo "**************************************************"
echo "1. open https://github.com/settings/ssh (in your pasteboard) and continue"

xcode-select --install

mkdir ~/.ssh
cd ~/.ssh/
ssh-keygen -t rsa -C "ryan.hanks@webfilings.com"
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
git clone git@github.com:ryanhanks-wf/bdub 
echo "**************************************************"
echo "press ctrl+d when xcode install completes"
cat

cd bdub
sudo gem install bundler
sudo bundle
bundle exec soloist
