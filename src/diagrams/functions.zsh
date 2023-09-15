function diagrams () {
    docker run --rm -it -v $PWD:$PWD -w $PWD $TOOLSHIP_IMAGE_NAME $@
}