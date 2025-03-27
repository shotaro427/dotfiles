# zsh aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# Powerlevel10kのインストールチェックとインストール
P10K_DIR=~/powerlevel10k
if [ ! -d "$P10K_DIR" ]; then
  echo "Powerlevel10kをインストールします..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# p10k設定ファイルが存在しない場合、デフォルトの設定ファイルをコピー
if [ ! -f ~/.p10k.zsh ]; then
  echo "p10k設定ファイルを作成します..."
  p10k configure
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.local/bin:$PATH"