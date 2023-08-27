FROM cimg/node:18.17.1
MAINTAINER juvaly

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get autoremove -y && \
    apt-get upgrade -y && \
    apt-get install -y default-jre

RUN apt-get install -y python-pip && \
    pip install awscli

RUN npm install -g serverless \ 
    serverless-offline \
    serverless-webpack \
    serverless-prune-plugin \
    serverless-plugin-split-stacks \
    serverless-plugin-custom-roles \
    serverless-offline-sns \
    serverless-s3-local \
    serverless-pseudo-parameters \
    mocha \
    babel-cli

USER circleci

CMD [ "node" ]
