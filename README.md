This is a Docker image contains Jupyter Scala.

For detail, see https://github.com/alexarchambault/jupyter-scala.

Quick start
-----------
[Docker](https://www.docker.com/) をインストールして、下記のコマンドを実行します。

    docker run -it -p {PORT}:8888 -v {WORK_DIR}:/notebooks negokaz/jupyter-scala

* `PORT` - Jupyter のサービスにアクセスするためのポート番号
* `WORK_DIR` - 作成した notebook を保存したり読み込んだりするためのディレクトリパス

ブラウザで `http://{DOCKER_HOST}:{PORT}` へアクセスすると Jupyter のスタートページが表示されます。

* `DOCKER_HOST` - Docker のホスト名もしくはIPアドレス

バックグラウンドで起動する場合は`-it`オプションの代わりに`-d`オプションを指定します。

    docker run -d -p {PORT}:8888 -v {WORK_DIR}:/notebooks negokaz/jupyter-scala

### 例

`PORT`に`8000`、`WORK_DIR`に`/Users/negokaz`を指定する場合、下記コマンドを実行します。

      docker run -it -p 8000:8888 -v /Users/negokaz:/notebooks negokaz/jupyter-scala

Windows で boot2docker を利用していて`C:\Users\negokaz`を`WORK_DIR`に指定する場合は`/c/Users/negokaz`のような書式で指定します。

boot2dockerで`DOKER_HOST`を調べるには下記コマンドを実行します。

    boot2docker ip

`DOCKER_HOST`が`192.168.59.103`の場合、ブラウザで http://192.168.59.103:8000 へアクセスすると Jupyter のスタートページが表示されます。
