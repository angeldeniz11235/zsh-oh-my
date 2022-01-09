
#!/bin/bash

#install zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#downloa nerd font zsh
wget -O ~/Downloads/Nerd-Fonts-Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
#install nerd font
sudo mkdir -p ~/.local/share/fonts/truetype/Nerd-Fonts
sudo mv ~/Downloads/Nerd-Fonts-Complete.ttf /usr/share/fonts/truetype/Nerd-Fonts/
fc-cache -f -v

#reset gnome terminal
dconf reset -f /org/gnome/terminal/
#dump gnome terminal settings
dconf dump /org/gnome/terminal/ > /tmp/gnome-settings.txt
#append the following text to gnome-settings.txt
echo "custom-command='/bin/zsh'
font='Hack Nerd Font Regular 12'
use-custom-command=true
use-system-font=false" >> /tmp/gnome-settings.text
#load gnome terminal settings
dconf load /org/gnome/terminal/ < /tmp/gnome-settings.text

#install powerlevel9k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#make p10k config file
touch ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
#copy p10k config file in current directory to ~/.cache
cp p10k-instant-prompt.zsh ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh

#copy zshrc file to home directory
cp .zshrc ~/.zshrc

#install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#install ruby
sudo apt-get install ruby-full

#install colorls
sudo gem install colorls

#source zshrc
source ~/.zshrc