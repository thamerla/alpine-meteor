FROM node:6.9.1-alpine

ENV BUILD_PACKAGES="python make gcc g++ git curl tar bzip2" \
    NODE_ENV=production

WORKDIR /

RUN apk add --update --no-cache  ${BUILD_PACKAGES} && \
    npm install -g node-gyp && \
    node-gyp install

COPY scripts /scripts

ONBUILD COPY .build /
ONBUILD RUN sh /scripts/build.sh
ONBUILD RUN sh /scripts/rebuild_bin_npm_modules.sh
ONBUILD RUN sh /scripts/clean.sh

EXPOSE 80

ENTRYPOINT sh /scripts/run.sh
