from python:3.8

run pwd

run ls

workdir /

run python -m venv .venv

run .venv/bin/pip install -r requirements.txt
