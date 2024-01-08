#!/bin/sh
# ------------------------------------------------------------------
# [gareth alexander] Command line tools install for Windows
#          Script to install command line tools
# ------------------------------------------------------------------

# Install Windows Subsystem for Linux (WSL)
# https://learn.microsoft.com/en-us/windows/wsl/install-manual
wsl --install

# Install Winget
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
# Go to: https://www.microsoft.com/p/app-installer/9nblggh4nns1#activetab=pivot:overviewtab

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# mkdir ~/.ssh && touch ~/.ssh/config
# ssh-keygen -t ed25519 -C "email@here.com"
# ssh-keygen -t rsa -b 4096 -C "email@here.com"
ssh-keygen -b 4096 -C "email@here.com"

# Right Click Run as Administrator on Powershell or Terminal
# start the ssh-agent in the background
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent
# Close Administrator shell

# Normal Powershell window
ssh-add C:\Users\YOURID\.ssh\id_rsa

echo Host *.acquia-sites.com > ~/.ssh/config
echo    HostKeyAlgorithms=+ssh-rsa >> ~/.ssh/config
echo    PubkeyAcceptedKeyTypes=+ssh-rsa >> ~/.ssh/config
echo >> ~/.ssh/config
echo Host * >> ~/.ssh/config
echo    IdentityFile ~/.ssh/id_rsa >> ~/.ssh/config

# Add keys to the your required sites then test with:
# ssh -T git@bitbucket.org
# ssh -T git@github.com
# ssh -T git@git.drupal.org
# ssh -T {{project_name}}@{{repo-id}}.prod.hosting.acquia.com

# https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/

# Open a Terminal in WSL using "ubuntu"
Then Run:
cp -r /mnt/c/Users/<username>/.ssh ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 700 ~/.ssh
# sudo apt install keychain
# echo "eval ``keychain --eval --agents ssh id_rsa" > ~/.bash_profile
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Test again from inside with:
# ssh -T git@bitbucket.org
# ssh -T git@github.com
# ssh -T git@git.drupal.org
# ssh -T {{project_name}}@{{repo-id}}.prod.hosting.acquia.com

# Leave Ubuntu
exit

# Install Powershell or Windows Terminal
# winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.WindowsTerminal

# Install putty
winget install -e --id PuTTY.PuTTY

# Install git
winget install -e --id Git.Git

# brew install wget curl
# brew tap shivammathur/php
# brew install shivammathur/php/php@7.4
# brew install php@8.1 php@8.2 git composer
# brew unlink php && brew link --overwrite --force php@7.4
# brew unlink php && brew link --overwrite --force php@8.1
# brew install mariadb sqlite
# brew install ansible@2.9 npm nvm

# Browsers
winget install -e --id Google.Chrome
winget install -e --id Mozilla.Firefox
winget install -e --id Microsoft.Edge
winget install -e --id AgileBits.1Password

# Dev IDEs
winget install -e --id JetBrains.PHPStorm
# winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Notepad++.Notepad++

# Productivity
winget install -e --id Meld.Meld
winget install -e --id Atlassian.Sourcetree
winget install -e --id Postman.Postman
winget install -e --id Dropbox.Dropbox
winget install -e --id Google.Drive

# Collaboration tools
# installed microsoft-teams
# installed microsoft-outlook
winget install -e --id SlackTechnologies.Slack
winget install -e --id Zoom.Zoom
winget install -e --id Discord.Discord

# Notes tools
# install skitch or other screenshot tool
winget install -e --id evernote.evernote

# Others
# winget install -e --id Adobe.Acrobat.Reader.32-bit
winget install -e --id Adobe.Acrobat.Reader.64-bit

# install imageoptim or other image optimising tool
# install Sequel Ace or other SQL managment tool
# install screaming-frog-seo-spider from https://www.screamingfrog.co.uk/seo-spider/

winget install -e --id TablePlus.TablePlus
winget install -e --id Grammarly.Grammarly
winget install -e --id Spotify.Spotify

#Update all programs
winget upgrade --all
