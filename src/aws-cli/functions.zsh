function aws () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v "$HOME/.aws/config:/root/.aws/config:ro" -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_PAGER -e AWS_ACCESS_KEY_ID --entrypoint "/usr/local/bin/aws" $TOOLSHIP_IMAGE_NAME $@
}

function mssh () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v "$HOME/.aws/config:/root/.aws/config:ro" -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_PAGER -e AWS_ACCESS_KEY_ID --entrypoint "/usr/local/bin/mssh" $TOOLSHIP_IMAGE_NAME $@
}

function msftp () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v "$HOME/.aws/config:/root/.aws/config:ro" -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_PAGER -e AWS_ACCESS_KEY_ID --entrypoint "/usr/local/bin/msftp" $TOOLSHIP_IMAGE_NAME $@
}