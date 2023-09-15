function wrangler () {
    docker run --rm -it -v $PWD:$PWD -w $PWD -e HOME -v $HOME/.config/.wrangler:$HOME/.config/.wrangler -p 8976:8976 $TOOLSHIP_IMAGE_NAME $@
}