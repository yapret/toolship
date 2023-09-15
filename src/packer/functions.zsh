function packer () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID $TOOLSHIP_IMAGE_NAME $@
}