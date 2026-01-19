#!/bin/bash

# VNCパスワードの設定を非対話形式（エラーが出ない方法）に変更
mkdir -p ~/.vnc
x11vnc -storepasswd "$VNC_PASSWORD" ~/.vnc/passwd

# 以前の実行で残ったロックファイルを削除（Server is already activeエラー対策）
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1

# 仮想ディスプレイの起動
Xvfb "$DISPLAY" -screen 0 "$VNC_RESOLUTION"x24 -ac +extension GLX +render -noreset &
sleep 2

# ウィンドウマネージャ起動
fluxbox -display "$DISPLAY" &

# VNCサーバ起動
x11vnc -display "$DISPLAY" -rfbauth ~/.vnc/passwd -loop -forever -shared -bg -rfbport 5901 -wait 5 &

# noVNC（ブラウザブリッジ）起動
# --vnc オプションを削除し、正しい引数の順番に修正しました
websockify --web /usr/share/novnc/ 6901 localhost:5901 &

# OpenCPN起動
opencpn &

# プロセスを維持
wait -n