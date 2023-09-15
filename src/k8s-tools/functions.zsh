function kubectl () {
    args=($@)
    docker_args=()
    # if $1 exists and is equal to "proxy"
    if [ ! -z "$1" ] && [ "$1" = "proxy" ]; then
        args+=("--address=0.0.0.0")
        docker_args+=("-p" "127.0.0.1:8001:8001")
    fi

    docker run --rm -it \
    -v $HOME/.kube:/root/.kube \
    -v $PWD:$PWD -w $PWD \
    ${docker_args[@]} \
    $TOOLSHIP_IMAGE_NAME kubectl $args
}