#!/usr/bin/env zsh

# Author: Yann Esposito
# License: MIT

## 1. get current version

(($#<1)) && {
    echo "Usage: $0:t VERSION PART [QUALIFIER]" >&2
    echo "where: VERSION is a version number" >&2
    echo "       PART can be major, minor, patch, unqualify or qualifier" >&2
    echo "       QUALIFIER can be any string" >&2
    echo >&2
    echo "Example 1: $0:t 1.10.1 minor"
    echo "           1.11.0"
    echo "Example 2: $0:t 0.6.0-SNAPSHOT unqualify"
    echo "           0.6.0"
    echo "Example 3: $0:t 1.6.0-SNAPSHOT patch"
    echo "           1.6.1"
    exit 1
}

releaseversion="$1"
bumppart="$2"
bumpqual="$3"

## 2. next-version number

parseversion() {
    local version=$1
    local major=$(echo $version|perl -pe 's/(\d+)\.(\d+)\.(\d+)(-([^-]+))?/$1/')
    local minor=$(echo $version|perl -pe 's/(\d+)\.(\d+)\.(\d+)(-([^-]+))?/$2/')
    local patch=$(echo $version|perl -pe 's/(\d+)\.(\d+)\.(\d+)(-([^-]+))?/$3/')
    local qualifier=$(echo $version|perl -pe 's/(\d+)\.(\d+)\.(\d+)(-([^-]+))?/$5/')

    echo "$major $minor $patch '$qualifier'"
}

bump() {
    local part=$1
    local major=$2
    local minor=$3
    local patch=$4
    local qualifier=$5
    local newqualifier=$6

    # echo "DEBUG: $part $major $minor $patch $qualifier $newqualifier" >&2

    case $part in
        major) echo $((major+1)).0.0;;
        minor) echo $major.$((minor+1)).0;;
        patch) echo $major.$minor.$((patch+1));;
        unqualify) echo $major.$minor.$patch;;
        qualifier) echo $major.$minor.$patch-$newqualifier;;
        *) echo "$part should be either major, minor, patch or qualifier, got '$part'"
    esac
}

newversion=$(bump $bumppart $(parseversion $releaseversion) $bumpqual)
echo $newversion
