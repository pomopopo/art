#!/bin/bash
set -e
set -x


PYTHON_COMMAND=python
PIP_COMMAND=pip

if [ "$TRAVIS_OS_NAME" == "osx" ]
then
	 PYTHON_COMMAND=python3
	 PIP_COMMAND=pip3
fi

$PYTHON_COMMAND setup.py install
$PYTHON_COMMAND -m art test
$PYTHON_COMMAND -m art test2
$PYTHON_COMMAND -m art testcov
$PYTHON_COMMAND -m art testcov2

if [ "$TRAVIS_OS_NAME" == "osx" ]
then
	$PIP_COMMAND install --upgrade --upgrade-strategy=only-if-needed -r dev-requirements.txt --user
else
	$PIP_COMMAND install --upgrade --upgrade-strategy=only-if-needed -r dev-requirements.txt
fi