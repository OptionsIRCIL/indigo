# Online Documentation

Online documentation for Indigo is generated with a tool
named [Zensical](https://zensical.org/). This allows for
user-friendly documentation to be published online without
the need to write HTML by hand (in most cases).

## Configuring your Development Environment

Zensical runs on Python, so your machine must have Python installed.
The [uv](https://docs.astral.sh/uv/) package manager must also
be installed to pull project packages.

A virtual environment (`venv`) can be created and packages can
be pulled by running the following command:

```shell
uv sync
```

## Serving Documentation Locally

Zensical provides a development server. The following command may
be run to both activate the configured virtual environment and 
serve with file watching:

```shell
uv run zensical serve
```
