#!/usr/bin/env bash
set -eo pipefail; [[ $TRACE ]] && set -x

function add_homebrew_tap {
    echo "--> Adding homebrew tap: $1"
    brew tap $1
}

function install_homebrew_formula {
    echo "--> Installing homebrew formula: $1"
    brew install $1
}

function test_homebrew_formula {
    echo "--> Testing homebrew formula: $1"
    brew test $1
}

function audit_homebrew_formula {
    echo "--> Auditing homebrew formula: $1"
    brew audit --strict $1
}

function main {
    local tap="rclement/tools"
    local formulae="dokku"

    add_homebrew_tap $tap

    for f in $formulae
    do
        install_homebrew_formula $f
        test_homebrew_formula $f
        audit_homebrew_formula $f
    done
}

main

