FROM cimg/node:17.0.0
MAINTAINER juvaly

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get autoremove -y && \
    apt-get upgrade -y && \
    apt-get install -y default-jre

RUN apt-get install -y python3-pip && \
    pip3 install awscli

RUN npm install -g serverless@2.47.0 \ 
    serverless-offline@7.0.0 \
    serverless-webpack@5.5.1 \
    serverless-prune-plugin@1.4.3 \
    serverless-plugin-split-stacks \
    serverless-plugin-custom-roles \
    serverless-offline-sns \
    serverless-s3-local@0.5.2 \
    serverless-pseudo-parameters@2.5.0 \
    mocha \
    babel-cli

USER circleci

CMD [ "node" ]
