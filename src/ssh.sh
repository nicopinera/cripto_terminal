#!/usr/bin/env bash

set -o allexport
source .env

# GEneracion de clave con el email
ssh-keygen -t ed25519 -C $EMAIL