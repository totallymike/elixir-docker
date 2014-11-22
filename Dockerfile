FROM buildpack-deps:wheezy

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && apt-get install -y locales && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen && \
    echo "export LANG=en_US.UTF-8" >> /etc/profile 

ENV LANG en_US.UTF-8

RUN apt-get install -y procps && \
    curl -O http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    apt-get update && \
    apt-get install -y erlang-nox elixir && \
    rm -rf /var/apt/lists/* \
    rm erlang-solutions_1.0_all.deb
