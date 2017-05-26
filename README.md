# bioinformatics software

Mostly a template for snakemake to download and install software that might be used in the workflow.
This is meant to be fairly lightweight so it requires minimal tooling.

Current requirements:

- snakemake
- curl
- basic UNIX utilities

# configuration

You MUST define the following 2 variables in `config.py`:

- `BASE`: a base destination for files. e.g.: `/Users/hjp` on Mac or `/home/hjp` on Linux.
- `OS`: 'mac' or 'linux' currently supported.

Here is an example `config.py`:

```
BASE = '/Users/hjp'
OS = 'mac'
```

Make sure to change `BASE` in Snakefile to the destination you would like to install things into.

## supported tools

- kallisto 0.43.1
- bowtie2 2.3.2
- cufflinks 2.2.1
