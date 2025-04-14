#!/bin/bash


# 必要なパッケージのインストールチェックと実行
check_and_install() {
    if ! command -v $1 &> /dev/null; then
        echo "✨️✨️✨️✨️ $1 をインストールします..."
        sudo apt-get install -y $1
    else
        echo "✨️✨️✨️✨️ $1 は既にインストールされています"
    fi
}

# リトライ付き apt update
# 最大6 * 10秒 = 60秒待つ
echo "✨️✨️✨️✨️ システムをアップデートします..."
for i in {1..6}; do
  echo "✨️✨️✨️✨️ aptの更新を試みています... $(($i))回目"
  if sudo apt update; then
    echo "✨️✨️✨️✨️ aptの更新が完了しました"
    break
  else
    echo "✨️✨️✨️✨️ aptの更新に失敗しました。10秒後に再試行します..."
    sleep 10
  fi
done

# システムのアップデート
echo "✨️✨️✨️✨️ システムをアップグレードします..."
sudo apt-get upgrade -y

# 必要なパッケージのインストール
check_and_install exa
check_and_install bat
check_and_install duf
check_and_install fzf

echo "インストールが完了しました。" 