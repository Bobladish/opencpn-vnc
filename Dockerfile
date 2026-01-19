FROM ubuntu:24.04

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive \
    VNC_PASSWORD=vncpassword \
    VNC_RESOLUTION=1280x720 \
    DISPLAY=:1

# 必要なツールとOpenCPN PPAの追加、インストール
RUN apt-get update && apt-get install -y \
    software-properties-common \
    xvfb \
    x11vnc \
    websockify \
    novnc \
    fluxbox \
    dbus-x11 \
    wget \
    sudo \
    --no-install-recommends && \
    add-apt-repository ppa:opencpn/opencpn && \
    apt-get update && \
    apt-get install -y opencpn && \
    rm -rf /var/lib/apt/lists/*

# 起動スクリプトをコピー
COPY start_opencpn.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start_opencpn.sh

# ポート: 6901(ブラウザ用), 5901(VNC用)
EXPOSE 6901 5901

CMD ["/usr/local/bin/start_opencpn.sh"]