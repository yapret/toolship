function terraform () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v $HOME/.ssh/known_hosts:/root/.ssh/known_hosts:ro -v $HOME/.terraform.d:/root/.terraform.d -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID $TOOLSHIP_IMAGE_NAME $@
}