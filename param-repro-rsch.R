#!/usr/bin/env Rscript

# param-repro-rsch.R
# LICENSE?!?!

# This script generates a Parameterized Reproducibe Research report.
# Run it at the command line, thusly:

# ./param-repro-rsch.R --verbose --config config.R

# Use the --help flag to get full usage information.

# load all libraries here, not in the Rmd file, to get errors upfront.
suppressPackageStartupMessages(library(rmarkdown))
suppressPackageStartupMessages(library(knitr))
suppressPackageStartupMessages(library(optparse))
suppressPackageStartupMessages(library(httr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(pander))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(stringr))


# command line spec
option_list <- list(
  make_option(c("-v", "--verbose"), action="store_true", default=TRUE,
              help="Print extra output"),
  make_option(c("-c", "--config"), help="Configuration filespec")
)

# get command line options
# if run interactively (e.g., in Rstudio), use defaults
opt <- if (interactive()) {
  list(verbose=TRUE, config="config.R")
} else parse_args(OptionParser(option_list=option_list))

if (!file.exists(opt$config)) stop("--config parameter must exist and be a config file!")

# load the config file
source(opt$config)
stopifnot(exists("line_color"))

# do everything
render("param-repro-rsch.Rmd", 
       output_file=sprintf("param-repro-rsch-%s.html", line_color),
       quiet=!opt$verbose)

