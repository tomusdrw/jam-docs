#!/bin/bash

set -e

mkdir -p node_modules
wget https://raw.githubusercontent.com/zdave-parity/jam-np/refs/heads/main/simple.md -O node_modules/simple.md
wget https://hackmd.io/@polkadot/jip1/download -O node_modules/host-call-log.md

cp docs/knowledge/advanced/simple-networking/spec.md.tmpl docs/knowledge/advanced/simple-networking/spec.md
cat node_modules/simple.md >> docs/knowledge/advanced/simple-networking/spec.md
perl -pi -e "s/BUILD_DATE/$(date +%Y-%m-%d)/" docs/knowledge/advanced/simple-networking/spec.md

cp docs/knowledge/testing/polka-vm/host-call-log.md.tmpl docs/knowledge/testing/polka-vm/host-call-log.md
cat node_modules/host-call-log.md >> docs/knowledge/testing/polka-vm/host-call-log.md
perl -pi -e "s/BUILD_DATE/$(date +%Y-%m-%d)/" docs/knowledge/testing/polka-vm/host-call-log.md

npm run convert-yaml docs/dao/index.md

yarn build
