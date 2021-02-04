FROM node:12-stretch

WORKDIR /app

# Signal handling for PID1 https://github.com/krallin/tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# RUN apt-get update &&\
#     apt-get install -y curl git-core &&\
#     curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
#     apt-get update &&\
#     apt-get install -y nodejs

RUN apt-get update &&\
    apt-get install -y build-essential

# RUN adduser ethnetintel 

COPY package.json .

RUN  npm install

COPY . .

# USER ethnetintel
ENTRYPOINT ["/tini", "--"]