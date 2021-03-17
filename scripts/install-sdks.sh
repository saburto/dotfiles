#!/bin/bash

source "$HOME/.sdkman/bin/sdkman-init.sh"


sdk update
sdk install java
sdk install mvnd
sdk install gradle
sdk install leiningen


