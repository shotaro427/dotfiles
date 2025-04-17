# zsh がなければインストールして切り替える
if ! command -v zsh >/dev/null 2>&1; then
  echo "✨️ zsh が見つからないのでインストールします"

  if [ -f /etc/debian_version ]; then
    sudo apt-get update && sudo apt-get install -y zsh
  elif [ -f /etc/redhat-release ]; then
    sudo yum install -y zsh
  else
    echo "サポートされていない OS です。手動で zsh をインストールしてください。"
    return
  fi
fi

# zshが存在するなら起動する（すでにzsh内の場合はスキップ）
if [ -n "$PS1" ] && [ -z "$ZSH_VERSION" ]; then
  echo "✨️ zsh に切り替えます"
  exec zsh
fi
