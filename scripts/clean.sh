#!/bin/sh

set -e

apk del  --purge ${BUILD_PACKAGES} wget

npm uninstall -g node-gyp
npm cache clear
npm uninstall -g npm

rm -rf /tmp/* /var/cache/apk/* /root/.node-gyp ./root/.npm
