# !/bin/zsh
# https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "
vim ~/.zshrc find plugins=(git)
Append zsh-autosuggestions & zsh-syntax-highlighting to plugins() like this plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
"