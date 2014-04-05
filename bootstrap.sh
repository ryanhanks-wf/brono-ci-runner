open http://support.apple.com/downloads/DL1572/en_US/JavaForOSX2013-05.dmg

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
# wait for confirm 1.

pbcopy < ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub
say "add the key"
echo "**************************************************"
echo "2. Add the key and press ctrl+d to continue"
cat

ssh -T git@github.com
cd

echo "**************************************************"
echo "press ctrl+d when xcode install completes"
cat

# git clone git@github.com:ryanhanks-wf/brono-ci-runner
# cd ~/brono-ci-runner
# sudo gem install bundler
# sudo bundle
# bundle exec soloist





date
mkdir ~/.pip 
cat > ~/.pip/pip.conf <<EOF
[global]
timeout = 15
index-url = https://ryanhanks-wf:e789c9a2a4@pypi.webfilings.org/simple/
EOF


ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew install node cmake python ant jenkins
pip install virtualenv
 
 
npm install -g grunt-cli cordova phantomjs
 
sudo gem install compass-rgbapng

# install 2
 
mkdir ~/Library/LaunchAgents
ln -sfv /usr/local/opt/jenkins/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.jenkins.plist

 
# update plugin list from advanced tab
# download cli.jar from 
java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin -restart github
echo "press ctrl+d when jenkins has restarted"
cat
cat > brono.job <<EOF 
<?xml version='1.0' encoding='UTF-8'?>
<project>
  <actions/>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties>
    <com.coravy.hudson.plugins.github.GithubProjectProperty plugin="github@1.8">
      <projectUrl>https://github.com/ryanhanks-wf/brono/</projectUrl>
    </com.coravy.hudson.plugins.github.GithubProjectProperty>
  </properties>
  <scm class="hudson.plugins.git.GitSCM" plugin="git@2.1.0">
    <configVersion>2</configVersion>
    <userRemoteConfigs>
      <hudson.plugins.git.UserRemoteConfig>
        <url>git+ssh://git@github.com/ryanhanks-wf/brono</url>
        <credentialsId>cdb26fcd-d89e-4fe7-b920-ccea219edee4</credentialsId>
      </hudson.plugins.git.UserRemoteConfig>
    </userRemoteConfigs>
    <branches>
      <hudson.plugins.git.BranchSpec>
        <name>**</name>
      </hudson.plugins.git.BranchSpec>
    </branches>
    <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
    <submoduleCfg class="list"/>
    <extensions/>
  </scm>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers>
    <com.cloudbees.jenkins.GitHubPushTrigger plugin="github@1.8">
      <spec></spec>
    </com.cloudbees.jenkins.GitHubPushTrigger>
    <hudson.triggers.SCMTrigger>
      <spec>* * * * *</spec>
      <ignorePostCommitHooks>false</ignorePostCommitHooks>
    </hudson.triggers.SCMTrigger>
  </triggers>
  <concurrentBuild>false</concurrentBuild>
  <builders>
    <hudson.tasks.Shell>
      <command>echo &quot;success&quot;
export PATH=/usr/local/bin:$PATH
rm -rf ~/.brono
npm install
workspace_path=$WORKSPACE/tmp/$BUILD_NUMBER
mkdir -p $workspace_path
cd $workspace_path
brono_path=$WORKSPACE/bin/brono
$brono_path init
$brono_path install
      </command>
    </hudson.tasks.Shell>
  </builders>
  <publishers/>
  <buildWrappers/>
</project>
EOF 
cat brono.job | java -jar jenkins-cli.jar -s http://localhost:8080/ create-job brono-install 
