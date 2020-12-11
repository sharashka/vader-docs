Notes on tools
**************

Black
=====

An opinionated Python source code formatter.

Reference
---------

`Index <https://black.readthedocs.io/en/stable/>`__

Basic Usage
-----------

Add to `pyproject.toml` an entry like this,

::

    [tool.black]
    line-length = 88
    target-version = ['py38']
    include = '\.pyi?$'
    exclude = '''

    (
      /(
          \.eggs         # exclude a few common directories in the
        | \.git          # root of the project
        | \.hg
        | \.mypy_cache
        | \.tox
        | \.venv
        | _build
        | buck-out
        | build
        | dist
      )/
    )
    '''

so you can run

::

    $ black .

Git Hooks
=========

Handling Git events (on the client side).

Reference
---------

`Index <https://git-scm.com/docs/githooks>`__
`Introduction <https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks>`__

Basic Usage
-----------

Pre-commit hook, Black for Python example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Create `.pre-commit-config.yaml`::

    repos:
      - repo: https://github.com/ambv/black
        rev: stable
        hooks:
        - id: black

Install and run::

    $ pip install pre-commit
    $ pre-commit install
    $ pre-commit run --all-files

GitHub Webhooks
===============

Mypy
====

Optional static typing for Python.

Reference
---------

`Index <https://mypy.readthedocs.io/en/latest/index.html>`__
`Configuration <https://mypy.readthedocs.io/en/latest/config_file.html#config-file>`__

Addons
------

`Pydantic plugin <https://pydantic-docs.helpmanual.io/mypy_plugin/>`__

Basic Usage
-----------

Configure `setup.cfg`::

    [mypy]
    plugins = pydantic.mypy
    ignore_missing_imports = True

Run::

    $ mypy src/

Limitations
-----------

A pydantic-related entry like this ::

    vader_id: constr(max_length=100)

triggers an error::

    src/schemas.py:17: error: Invalid type comment or annotation
    src/schemas.py:17: note: Suggestion: use constr[...] instead of constr(...)

Discussion
----------

`#156 <https://github.com/samuelcolvin/pydantic/issues/156>`__
`#239 <https://github.com/samuelcolvin/pydantic/issues/239>`__

Pipm
====

`pipm` is a lightweight wrapper for `pip`.
It extends `pip` functionality by keeping top-level dependencies in
`setup.cfg` and managing `requirements` files.

Reference
---------

`Project repository
<https://github.com/jnoortheen/pipm>`__

Basic Usage
-----------

::

    $ source .venv/bin/activate
    $ pip install pipm

Update `setup.cfg`::

    $ pipm install pipm

Install a dependency::

    $ pipm install sphinx

Install a development dependency::

    $ pipm install sphinx-reload --dev

Install development dependencies from `dev-requirements.txt`::

    $ pipm install --dev

Install all dependencies from `*requirements*.txt`::

    $ pipm install --all

In a project maintained with `pipm` the relevant part of
`setup.cfg` is going to look like this::

    [options]
    install_requires = 
        pipm~=20.2.4
        sphinx~=3.3.1

    [options.extras_require]
    dev = 
        sphinx-reload~=0.2.0

Poetry
======

A heavyweight package manager for Python.

Reference
---------

`Index <https://python-poetry.org/docs/>`__
`CLI <https://python-poetry.org/docs/cli/>`__
`Configuration <https://python-poetry.org/docs/configuration/>`__
`Project structure <https://python-poetry.org/docs/pyproject/>`__
`Packaging/Publishing <https://python-poetry.org/docs/libraries/>`__

Discussion
----------

`WORKON_HOME (#214) <https://github.com/python-poetry/poetry/issues/214>`__

Addons
------

`Poetry - plugin for IntelliJ IDEs
<https://plugins.jetbrains.com/plugin/14307-poetry>`__

Basic Usage
-----------

First time::

    $ git clone <my-project>
    $ cd my-project
    $ poetry install

Session::

    $ poetry shell
    ...
    $ exit

or just::

    $ source .venv/bin/activate
    ...
    $ deactivate

depending on how you manage your virtual environments.

Poetry commands usually run just fine regardless of the
virtual environment being explicitly on/off, unless you rely on
WORKON_HOME. If such is the case, you have to manually
enter your virtual environment first.

Poetry uses either local `.venv`, or its own cache
of virtual environments (`~/.cache/pypoetry/virtualenvs`),
depending on `poetry.toml` entry::

    [virtualenvs]
    create = true
    in-project = true

It's always easy to check::

    $ poetry env info

Add/remove packages::

    $ poetry add [-D] package
    $ poetry remove [-D] package

Run `pytest` (or anything) without explicitly entering the virtual
environment::

    $ poetry run pytest