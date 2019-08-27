FROM judge0/api-base:0.3.0

RUN echo "deb http://deb.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    rm -rf /etc/apt/sources.list.d/* && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      libpq-dev \
      nodejs-legacy \
      npm \
      sudo && \
    rm -rf /var/lib/apt/lists/*

ENV PATH "/usr/local/ruby-2.3.3/bin:/opt/.gem/bin:$PATH"
ENV GEM_HOME "/opt/.gem/"
RUN echo "gem: --no-document" > /root/.gemrc && \
    gem install \
      rails:5.0.0 \
      bundler:1.15.4 \
      pg:0.18 && \
    npm install -g aglio@2.3.0

EXPOSE 3000

RUN apt-get update && apt-get install -y software-properties-common \
    && apt-get upgrade -y

RUN apt-get -y install lsb-release apt-transport-https ca-certificates \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list \
    && wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

RUN apt update &&  apt -y install php7.3 && apt install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json \
    && apt-get -y install sbcl \
    && curl https://dlang.org/install.sh | bash -s \
    && apt-get -y install erlang \
    && apt-get install elixir

RUN apt-get -y install groovy \
    && apt-get -y install fsharp \
    && apt-get -y install scala \
    && apt-get -y install gnu-smalltalk


WORKDIR /usr/src/api
COPY Gemfile* /usr/src/api/
RUN RAILS_ENV=production bundle

COPY . /usr/src/api
RUN RAILS_ENV=production bundle && \
    ./scripts/prod-gen-api-docs

CMD ["./scripts/run-server"]

LABEL maintainer="Herman Zvonimir Došilović, hermanz.dosilovic@gmail.com"
LABEL version="1.2.0"