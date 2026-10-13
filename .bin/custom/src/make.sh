#!/bin/bash

SRC_DIR=$(dirname "$1")

for src_file in "$SRC_DIR"/*.c; do
    if [ -f "$src_file" ]; then
        cc "$src_file" -o "$SRC_DIR/../${src_file%.c}"
    fi
done
