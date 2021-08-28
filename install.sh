#!/bin/bash

# macOS install script

echo "Installing Homebrew..."

if (which brew > /dev/null) then
  echo "Homebrew is already installed."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Check iTerm2 Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi iTerm.app) then
  echo "Already Installed!"
else
  brew install --cask iterm2
fi

echo "Check Firefox Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi Firefox) then
  echo "Already Installed!"
else
  brew install --cask firefox
fi

echo "Check Microsoft Edge Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Microsoft Edge") then
  echo "Already Installed!"
else
  brew install --cask microsoft-edge
fi

echo "Check Visual Studio Code Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Visual Studio Code") then
  echo "Already Installed!"
else
  brew install --cask visual-studio-code
fi

echo "Check Figma Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Figma.app") then
  echo "Already Installed!"
else
  brew install --cask figma
fi

echo "Check Discord Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Discord") then
  echo "Already Installed!"
else
  brew install --cask discord
fi

echo "Check MediaHuman Audio Converter Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "MediaHuman Audio") then
  echo "Already Installed!"
else
  brew install --cask mediahuman-audio-converter
fi

echo "Check discretescroll Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "DiscreteScroll") then
  echo "Already Installed!"
else
  brew install --cask discretescroll
fi

echo "Check Alfred Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Alfred 4.app") then
  echo "Already Installed!"
else
  brew install --cask alfred
fi

echo "Check Notion Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Notion.app") then
  echo "Already Installed!"
else
  brew install --cask notion
fi

echo "Check Cloudflare Warp Installation..."
if (mdfind "kMDItemKind == 'Application'" | grep -qi "Cloudflare Warp.app") then
  echo "Already Installed!"
else
  brew install --cask cloudflare-warp
fi

echo "Installing Node.js..."
if (which node > /dev/null) then
  echo "Node.js is already installed."
else
  /usr/local/bin/brew install node
fi

echo "Installing Golang..."
if (which go > /dev/null) then
  echo "Go is already installed."
else
  /usr/local/bin/brew install go
fi

echo "Installing Neovim..."
if (which nvim > /dev/null) then
  echo "Neovim is already installed."
else
  /usr/local/bin/brew install neovim
fi

echo "Installing Yarn..."
if (which yarn > /dev/null) then
  echo "Yarn is already installed."
else
  npm install -g yarn
fi

echo "Installing Fonts..."

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

echo "Installing Oh-My-Zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing recommended fonts for powerlevel10k..."

cd ~/Library/Fonts && { 
    curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Regular.ttf'
    cd -; }

cd ~/Library/Fonts && { 
    curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold.ttf'
    cd -; }

cd ~/Library/Fonts && { 
    curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Italic.ttf'
    cd -; }

cd ~/Library/Fonts && { 
    curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold Italic.ttf'
    cd -; }

echo "Installing powerlevel10k on Oh-My-Zsh..."

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Applying theme..."

node ./insertp10k.js
cp .p10k.zsh ~/.p10k.zsh


echo "Installing SpaceVim..."

curl -sLf https://spacevim.org/install.sh | bash