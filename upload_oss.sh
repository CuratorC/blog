#!/bin/bash

TARGET_BUCKET=ggt-blog

echo "uploading..."

hexo clean
hexo g

./ossutil64 -c ossutil.cfg rm -rf oss://$TARGET_BUCKET/
./ossutil64 -c ossutil.cfg cp -rf public/ oss://$TARGET_BUCKET/

echo "done"
