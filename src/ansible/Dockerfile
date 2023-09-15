FROM python:3.9.7-bullseye

RUN pip install ansible boto3 paramiko ec2instanceconnectcli

RUN apt update && apt install -y rsync && rm -rf /var/lib/apt/lists/*

ENTRYPOINT []