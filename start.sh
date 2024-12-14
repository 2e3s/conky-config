#!/bin/bash

for config in ~/.conky/config_*.lua; do
    echo "Starting conky with $config"
    conky -c "$config" --daemonize
done
