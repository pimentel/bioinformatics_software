# bioinformatics software

Mostly a template for snakemake to download and install software that might be used in the pipeline.
This is meant to be fairly lightweight so it requires minimal tooling.

Current requirements:

- snakemake
- curl
- basic UNIX utilities

Make sure to change `BASE` in Snakefile to the destination you would like to install things into.
