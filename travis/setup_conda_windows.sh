#!/bin/bash
# This script assumes we are running under git-bash (MinGW) on Windows

export DEBUG="True"
if [[ $DEBUG == True ]]; then
    set -x
fi

if [[ -z "${MINICONDA_VERSION}" ]]; then
    MINICONDA_VERSION=4.6.14
fi

echo "installing miniconda3"
choco install miniconda3 --params="'/AddToPath:1'" --version="$MINICONDA_VERSION";
export PATH="/c/tools/miniconda3/scripts:$PATH"
ls -1 /c/tools/miniconda3/scripts
source "/c/Users/travis/.bash_profile"
conda init bash
conda activate base

PIN_FILE_CONDA="/c/tools/miniconda3/conda-meta/pinned"
PIN_FILE="/c/tools/miniconda3/envs/test/conda-meta/pinned"

# Install common Python dependencies
echo "setting up common dependencies"
source "$( dirname "${BASH_SOURCE[0]}" )"/setup_dependencies_common.sh
