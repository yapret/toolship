function hugo () {
    args=($@)
    if [ $1 = "server" ]; then
        args+=("--bind" "0.0.0.0")
    fi
    docker run --rm -it -v $PWD:$PWD -w $PWD -p '127.0.0.1:1313:1313' $TOOLSHIP_IMAGE_NAME $args
}