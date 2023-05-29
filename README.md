### Install to My Mac
- prezto
- neovim
- byobu
- git
- wget
- docker
- docker-compose
- dive
- asdf
- go
- ruby
- kubectl
- kube-ps1
- kubectx

### 仮想マシンへの設定
- 自分用のユーザー作成とSSHの設定(useradd -m your_account_name, passwd your_account_password, ~/.ssh/authorized_keysの作成)
- 作成したユーザーにsudo権限をつける(usermod -G wheel your_account_name)
- MacからVMへssh接続を設定する（Macの~/.ssh/configに設定）
- sshd_configへのセキュリティ設定追加
  - rootユーザーでのsshを禁止する（PermitRootLogin no）
  - パスワードでのssh接続を禁止する（PasswordAuthentication no）
  - sshdをリスタートし、rootログイン、パスワードログインができないことを確認する（sudo systemctl restart sshd）
- IPアドレスの確認(ip a)
- ディスクサイズの確認(df -h)
- 各種パッケージのアップデート(yum list updates, yum update)
- パッケージアップデートを終えたら念のためrebootしておく
- sudo yum install gcc-c++ libcurl-devel cyrus-sasl-devel libxml2-devel mysql-community-client mysql-community-devel
- sudo yum -y install bzip2 gcc openssl-devel readline-devel zlib-devel

### dockerをインストール

dockerをインストール centosへのdocker install 公式
docker composeのインストール
```
$ sudo mkdir -p /usr/local/lib/docker/cli-plugins
$ sudo curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
$ sudo chmod a+x /usr/local/lib/docker/cli-plugins/docker-compose

バージョン確認
$ docker compose version
Docker Compose version v2.16.0
```

