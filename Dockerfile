FROM cimg/node:22.22.0
MAINTAINER juvaly

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y default-jre curl unzip && \
    # 2. Download and install AWS CLI v2
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    # 3. Cleanup to keep image small
    rm -rf awscliv2.zip ./aws && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    default-jre \
    awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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
