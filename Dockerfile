FROM ubuntu:20.04

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git

# IONのダウンロードとインストール
RUN wget https://sourceforge.net/projects/ion-dtn/files/ion-open-source-4.1.2.tar.gz \
    && tar -xzvf ion-open-source-4.1.2.tar.gz \
    && cd ion-open-source-4.1.2 \
    && ./configure \
    && make \
    && make install \
    && ldconfig

# 作業ディレクトリの設定
WORKDIR /dtn

# 設定ファイルとスクリプトをコピー
COPY ./host149.rc /dtn/
COPY ./host150.rc /dtn/

# エントリーポイント
ENTRYPOINT ["/bin/bash"]
