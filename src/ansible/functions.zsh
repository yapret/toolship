function ansible () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID --entrypoint "/usr/local/bin/ansible" $TOOLSHIP_IMAGE_NAME $@
}

function ansible-playbook () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID --entrypoint "/usr/local/bin/ansible-playbook" $TOOLSHIP_IMAGE_NAME $@
}

function ansible-galaxy () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -e AWS_SESSION_TOKEN -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID --entrypoint "/usr/local/bin/ansible-galaxy" $TOOLSHIP_IMAGE_NAME $@
}