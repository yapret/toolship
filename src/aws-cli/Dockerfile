FROM amazon/aws-cli:latest

RUN yum install -y python3 python3-pip jq openssh-clients && \
    pip3 install boto3 ec2instanceconnectcli

ENV LC_ALL=en_US.UTF-8

ENTRYPOINT []