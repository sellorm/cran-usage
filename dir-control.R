#!/usr/bin/env Rscript
# directory control

daily_rmd <- "docs/cran-usage.html"

main_index <- "docs/index.html"

if ( !file.exists(daily_rmd)){
  stop(paste0("Output file does not exist: ", daily_rmd))
}

if (file.exists(main_index)){
  file.remove(main_index)
}

year <- format(Sys.time(), "%Y")
month <- format(Sys.time(), "%m")
day <- format(Sys.Date()-1, "%d")

path <- paste0("docs/", year, "/", month, "/", day)

dir.create(path, recursive = TRUE)

target_file <- paste0(path, "/index.html")

file.rename(daily_rmd, target_file)

file.symlink(target_file, main_index)
