# Marine Security Lab: OpenCPN Browser-based Docker Setup

このプロジェクトは、船舶用ナビゲーションソフトウェアである **OpenCPN (v5.12.4)** を Docker コンテナ内で動作させ、Webブラウザ経由で操作可能にするための環境を提供します。

マリンセキュリティの研究や、環境に依存しないナビゲーションシステムの構築を目的としています。

## 特徴

* **最新版対応**: OpenCPN v5.12.4 (2025年9月リリース) を搭載。
* **ブラウザアクセス**: noVNC と websockify を組み込み、特別なソフトなしでブラウザから GUI 操作が可能。
* **軽量・高速**: Ubuntu 24.04 をベースに、公式 PPA を利用して構築。
* **永続化**: コンテナを削除しても設定や海図データが消えないようにボリューム設定済み。

## クイックスタート

Docker がインストールされている環境であれば、以下の 1 行で起動できます。

```bash
docker run -d -p 6901:6901 bobladish/opencpn-vnc:5.12.4

## パスワードの設定とセキュリティ

本イメージは、Webブラウザからのアクセスを保護するために VNC パスワードを必要とします。

### 初期パスワード
* デフォルト: `pass`

### パスワードの変更方法（推奨）
セキュリティを確保するため、以下のいずれかの方法でパスワードを変更して使用してください。

#### A. docker-compose.yml を編集する
`docker-compose.yml` 内の `VNC_PASSWORD` の値を書き換えて再起動します。
```yaml
environment:
  - VNC_PASSWORD=your_new_password

```bash
docker run -d -p 6901:6901 -e VNC_PASSWORD=your_new_password bobladish/opencpn-vnc:5.12.4