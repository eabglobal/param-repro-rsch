# Parameterizable Reproducible Research

An example of a useful pattern in R -- wrapping a reproducible research report in an R script 
with an external configuration file.

This demo pulls WMATA Disruption Report data from a public API, then based on the configuration
file, generates a custom PDF report complete with charts and tables.

Thank you to Code for DC for the link to the data on Open Data DC:
http://opendatadc.org/dataset/wmata-disruption-reports

### Running

You'll need to install the packages loaded at the top of the .R file. Then, edit `config.R` to 
be one of "Green", "Yellow", "Red", "Blue", or "Orange", and do this:

`./param-repro-rsch.R --verbose --config config.R`

You can also do `./param-repro-rsch.R -h` to see the usage information.

### Credits

Written by Harlan Harris at the [Education Advisory Board](http://eab.com). 

TBD: release as public domain under CC0?
