
#!/bin/bash

#get root permission
sudo -v

#install zsh
echo "Installing zsh"
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#download nerd font zsh
echo "Downloading nerd font zsh"
wget -O ~/Downloads/Nerd-Fonts-Complete.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
#install nerd font
echo "Installing nerd font"
sudo mkdir -p ~/.local/share/fonts/truetype/Nerd-Fonts
sudo mv ~/Downloads/Nerd-Fonts-Complete.ttf /usr/share/fonts/truetype/Nerd-Fonts/
fc-cache -f -v

#ask if you want to reset gnome terminal settings
echo "Do you want to reset gnome terminal settings? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    #reset gnome terminal settings
    echo "Resetting gnome terminal"
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
fi













#install powerlevel9k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#ask if you want to copy powerlevel10k config
echo "Do you want to copy the powerlevel10k config to your home directory? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    #copy p10k config file in current directory to ~/.cache
    cp p10k-instant-prompt.zsh ~/.cache/p10k-instant-prompt-${(%):-%n}.zsh
fi


#ask if you want to copy zshrc config
echo "Do you want to copy the zshrc config to your home directory? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    #copy zshrc file to home directory
    cp zshrc ~/.zshrc
fi


#install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#install zsh-autosuggestions
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#install ruby
echo "Installing ruby"
sudo apt-get install ruby-full

#install colorls
echo "Installing colorls"
sudo gem install colorls

#change default shell to zsh
echo "Changing default shell to zsh"
chsh -s /bin/zsh

#install tmux
echo "Installing tmux"
sudo apt-get install tmux

#copy .tmux.conf to home directory
#ask if you want to copy .tmux.conf to home directory
#echo "Do you want to copy .tmux.conf to your home directory? (y/n)"


#read -r response
#if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
#then
#    #copy .tmux.conf to home directory
#    cp .tmux.conf ~/.tmux.conf
#    #source .tmux.conf
#    source ~/.tmux.conf
#fi

#source zshrc
source ~/.zshrc