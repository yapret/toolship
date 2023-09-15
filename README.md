# 🚢 toolship
`toolship` is a small framework to containerize dev tools. It comes with a few tools ready to use, and you can easily add your own.

## Usage
```zsh
git clone https://github.com/yapret/toolship.git
cd toolship
./build.zsh
```

## Tools
Provided tools include:
- `ansible`
- `aws-cli`
- `diagrams.py`
- `hugo`
- `jq`
- `kubectl`
- `node` & `npm`
- `packer`
- `python`
- `terraform`
- `wrangler`

Those provided tools' installations are opinionated, and not necessarily consistent with each other, as I've accumulated them over the years. For example:
- `aws-cli` uses the latest version, where `python` is set to 3.11
- Some tools are "pure"/as-is, others have additional dependencies built-in (e.g. `requests` for `python`, which I use frequently)

## Architecture
`toolship` is built on top of [Docker](https://www.docker.com/). The `src` folder contains one directory per `tool`, each of which contains :
- (optional) a `Dockerfile` to build the tool's image
- (required) a `functions.zsh` script which defines functions named after the tool's commands, which will be used to run the tool's image. References to the tool's image should be made using the `$TOOLSHIP_IMAGE_NAME`.

The `build.zsh` script runs through each tool directory, builds the image if a `Dockerfile` is present, then adds the tool's functions to a global `.toolship.zsh` script. This script can then be sourced in your `.zshenv`.

## Adding tools
To add a tool, create a directory in `src` named after the tool, and add a `Dockerfile` and `functions.zsh` script. They will automatically be picked up on the next `build.zsh` run. See the existing tools for examples.