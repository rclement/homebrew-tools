import os
import subprocess
import sys


def _run_command(cmd):
    subprocess.run([cmd], shell=True)


def add_homebrew_tap(tap_name):
    cmd = 'brew tap {tap}'.format(tap=tap_name)
    _run_command(cmd)


def test_homebrew_formula(formula):
    cmd = 'brew test {formula}'.format(formula)
    _run_command(cmd)


def audit_homebrew_formula(formula):
    cmd = 'brew audit --strict {formula}'.format(formula)
    _run_command(cmd)


def main():
    tap = 'rclement/tools'
    formulae = ['dokku']

    add_homebrew_tap(tap)
    for f in formulae:
        test_homebrew_formula(f)
        audit_homebrew_formula(f)


if __name__ == '__main__': 
    sys.exit(main())

