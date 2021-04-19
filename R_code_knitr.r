# R_code_knitr.r

# set the working directory
setwd("C:/lab/")

# load the package knitr
library(knitr)

install.packages("tinytex")
stitch("R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
tinytex::install_tinytex()
tinytex::tlmgr_update()
