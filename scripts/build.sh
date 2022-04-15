#! /bin/bash

OUTPUT_DIR=dist/program

for program in ./src/*;
do
    if [[ $program == "client"]];
    then
        echo -e "\nBuilding client...\n";
        npm install;
    else
        echo -e "\nBuilding Solana program $program...\n";
        cargo build-bpf --manifest-path=./src/$program/Cargo.toml \
            --bpf-out-dir=$OUTPUT_DIR;
        solana program deploy dist/program/$program.so
    fi
done