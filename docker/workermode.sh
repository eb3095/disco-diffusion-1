#!/bin/bash
echo "Worker Started"

cd /workspace/disco-diffusion-1
git pull

if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
    echo "SSH Service Started"
fi

python workermode.py --dd_url $1 --agent $2