function jq () {
    docker run --rm -i -v $PWD:$PWD -w $PWD $TOOLSHIP_IMAGE_NAME jq $@
}