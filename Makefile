BUILDDIR := $(shell pwd)

.ONESHELL:
SHELL = /bin/bash
.SHELLFLAGS = -e

.NOTPARALLEL:
.PHONY: docs

all: install

venv:
	python -m venv $(BUILDDIR)/.venv
	. $(BUILDDIR)/.venv/bin/activate

install: venv
	pip install -r requirements.txt

uninstall:
	rm -rfv $(BUILDDIR)/.venv

docs:
	sphinx-build -b html docs docs/_build
