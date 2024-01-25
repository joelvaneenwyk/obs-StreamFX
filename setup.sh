#!/usr/bin/env bash

function setup() {
    local source_root
    source_root="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" &>/dev/null && cd ../../../ && pwd)"

    # pushd "${source_root}/" >/dev/null || return 7
    # for f in "${plugin_source_root}"/patches/obs-studio/*.patch; do
    #     [ -e "$f" ] || continue
    #     echo "Applying patch '${f}''..."
    #     git apply "$f"
    # done
    # popd >/dev/null || return 8

    echo "Workspace root: ${source_root}"
}

setup
