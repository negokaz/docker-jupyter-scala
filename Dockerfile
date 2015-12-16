FROM jupyter/notebook

MAINTAINER negokaz <negokaz@gmail.com>

# Install necessary packages

RUN apt-get update && apt-get install -y \
        wget \
        openjdk-7-jdk

ENV SCALA_VERSION 2.11.6

RUN wget --no-verbose http://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb \
        && dpkg -i scala-*.deb \
        && rm      scala-*.deb

# Setup jupyter-scala
# For detail, see https://github.com/alexarchambault/jupyter-scala

RUN wget --no-verbose https://oss.sonatype.org/content/repositories/snapshots/com/github/alexarchambault/jupyter/jupyter-scala-cli_2.11.6/0.2.0-SNAPSHOT/jupyter-scala_2.11.6-0.2.0-SNAPSHOT.tar.xz \
        && mkdir jupyter-scala \
        && tar Jxvf jupyter-scala_*.tar.xz --strip=1 -C jupyter-scala \
        && rm       jupyter-scala_*.tar.xz \
        && ./jupyter-scala/bin/jupyter-scala

# Cleanup

RUN apt-get remove -y --purge wget \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Make workspace and run ipython notebook

VOLUME  ["/notebooks"]
WORKDIR /notebooks

EXPOSE  8888
ENTRYPOINT ["ipython","notebook","--ip=0.0.0.0","--port=8888","--no-browser"]
