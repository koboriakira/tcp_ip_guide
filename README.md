# README

[『Linuxで動かしながら学ぶTCP/IP入門』](https://www.amazon.co.jp/exec/obidos/ASIN/B085BG8CH5/momijiame-22/)の学習用に、Docker環境を提供します。  
コマンドは本書および著者の[Githubリポジトリ](https://github.com/momijiame/linux-tcpip-book)を参照ください。

とくにネットワークネームスペースの準備をシェル化することで、ネットワークの準備をすぐ済ませます。

## 注意

`6-3.sh` でDHCPサーバを準備することはできるのですが、  
その後の `dhclient` をこのDocker環境では実行できないため、DHCPクライアントの動作確認ができません。

## 準備

このリポジトリをcloneします。

```
git clone git@github.com:koboriakira/tcp_ip_guide.git
```

クローンしたディレクトリ上で、Dockerイメージをビルドします。

```
docker build -t tcp_ip_guide_image .
```

下記のコマンドまたは `run_docker.sh` を実行して、Dockerコンテナを作成します。

```
docker run -it --rm --privileged --name tcp_ip_guide tcp_ip_guide_image
```

## 利用、学習について

* 各章の重要なコマンドをシェルとして `/var/tmp` 内にまとめているので、好きなものを実行してください。
* 他のコマンドを実行する場合は、先んじて `delete_netns.sh` を実行してネットワークを削除してください。
* 学習のために、最初は「写経」することをおすすめします。
