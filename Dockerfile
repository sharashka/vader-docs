from python:3.8

run mkdir /src/

run pwd

run ls

copy requirements.txt /src/requirements.txt

workdir /src/

run python -m venv .venv

run /src/.venv/bin/pip install -r requirements.txt
