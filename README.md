# Marine Security Lab: OpenCPN ブラウザベース Docker セットアップ

## 日本語

### 概要

このプロジェクトは、船舶用ナビゲーションソフトウェアである **OpenCPN (v5.12.4)** を Docker コンテナ内で動作させ、Webブラウザ経由で操作可能にするための環境を提供します。マリンセキュリティの研究や教育目的で開発されました。

### 特徴

* **最新版対応**: OpenCPN v5.12.4 (2025年9月リリース) を搭載
* **ブラウザアクセス**: noVNC を利用し、特別なソフトウェアなしでブラウザから GUI 操作が可能
* **軽量設計**: Ubuntu 24.04 をベースに、公式 PPA を利用して構築
* **データ永続化**: コンテナを削除しても設定や海図データが消えないようにボリューム設定済み

### クイックスタート

Docker がインストールされている環境であれば、以下のコマンドで起動できます。

```bash
docker run -d -p 6901:6901 -e VNC_PASSWORD=pass bobladish/opencpn-vnc:5.12.4
```

**アクセス URL**: http://localhost:6901/vnc.html

### パスワード設定とセキュリティ

VNC パスワードはブラウザセッションを保護するために必須です。

**デフォルトパスワード**: `pass`

**重要**: セキュリティのため、特に研究環境では以下のいずれかの方法でパスワードを変更してください。

#### A. Docker Compose 経由（推奨）

`docker-compose.yml` を編集します：

```yaml
environment:
  - VNC_PASSWORD=your_secure_password
```

#### B. Docker Run 経由

```bash
docker run -d -p 6901:6901 -e VNC_PASSWORD=new_password bobladish/opencpn-vnc:5.12.4
```

### 開発環境セットアップ

ビルドをカスタマイズする場合は Docker Compose を使用します。

リポジトリをクローン：
```bash
git clone https://github.com/Bobladish/opencpn-vnc.git
```

ディレクトリに移動：
```bash
cd opencpn-vnc
```

ビルドと起動：
```bash
docker compose up -d --build
```

### ディレクトリ構造

* **Dockerfile**: イメージの定義
* **docker-compose.yml**: コンテナオーケストレーションと環境設定
* **start_opencpn.sh**: Xvfb、VNC、OpenCPN の初期化スクリプト
* **.gitignore**: パスワードなど機密情報と大容量チャートデータの GitHub へのプッシュを防止

### リンク

* **GitHub**: https://github.com/Bobladish/opencpn-vnc
* **Docker Hub**: https://hub.docker.com/r/bobladish/opencpn-vnc

### 免責事項

このプロジェクトはセキュリティ研究と教育目的の用途を想定しています。実際のナビゲーションでの使用は自己責任で行ってください。

---

## English

### Overview

Marine Security Lab: OpenCPN Browser-based Docker Setup. This project provides a containerized environment for OpenCPN v5.12.4 accessible directly via any modern web browser. Developed for Marine Security Research and educational purposes.

### Features

* **Latest Version**: Includes OpenCPN v5.12.4 (Released September 2025)
* **Zero Install**: Instant GUI access via web browser using noVNC
* **Lightweight**: Based on Ubuntu 24.04 with official PPA for stability
* **Persistence**: Volumes configured to save charts and user settings automatically

### Quick Start

Run the environment with a single command if you have Docker installed:

```bash
docker run -d -p 6901:6901 -e VNC_PASSWORD=pass bobladish/opencpn-vnc:5.12.4
```

**Access URL**: http://localhost:6901/vnc.html

### Configuration & Security

#### Password Management

A VNC password is required to protect your browser session.

**Default Password**: `pass`

**Important**: For security, especially in research environments, you must change the password using one of the following methods:

##### A. Via Docker Compose (Recommended)

Modify your docker-compose.yml:

```yaml
environment:
  - VNC_PASSWORD=your_secure_password
```

##### B. Via Docker Run

```bash
docker run -d -p 6901:6901 -e VNC_PASSWORD=new_password bobladish/opencpn-vnc:5.12.4
```

### Setup for Development

If you want to customize the build or use Docker Compose:

Clone the repository:
```bash
git clone https://github.com/Bobladish/opencpn-vnc.git
```

Go to the directory:
```bash
cd opencpn-vnc
```

Build and launch:
```bash
docker compose up -d --build
```

### Directory Structure

* **Dockerfile**: Image definition
* **docker-compose.yml**: Container orchestration and environment settings
* **start_opencpn.sh**: Initialization script for Xvfb, VNC, and OpenCPN
* **.gitignore**: Prevents sensitive files (passwords) and large chart data from being pushed to GitHub

### Links

* **GitHub**: https://github.com/Bobladish/opencpn-vnc
* **Docker Hub**: https://hub.docker.com/r/bobladish/opencpn-vnc

### Disclaimer

This project is intended for security research and educational purposes. Use at your own risk for actual navigation.
