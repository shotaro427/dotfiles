#!/bin/bash

# 必要なパッケージのインストールチェックと実行
check_and_install() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 をインストールします..."
        sudo apt-get install -y $1
    else
        echo "$1 は既にインストールされています"
    fi
}

# システムのアップデート
echo "システムをアップデートします..."
sudo apt-get update
sudo apt-get upgrade -y

# 必要なパッケージのインストール
check_and_install exa
check_and_install bat
check_and_install duf
check_and_install fzf

echo "インストールが完了しました。" 