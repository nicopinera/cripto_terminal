#!/usr/bin/env bash

set -o allexport
source .env

# Generacion de clave con el email
# Dar Enter para skip
ssh-keygen -t ed25519 -C $EMAIL

