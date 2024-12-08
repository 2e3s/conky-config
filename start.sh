#!/bin/bash

for config in ~/.config/conky/config_*.lua; do
    echo "Starting conky with $config"
    conky -c "$config" --daemonize
done
