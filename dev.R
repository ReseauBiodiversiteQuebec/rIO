# usethis::create_package("~/dev/rIO")

usethis::use_build_ignore("dev.R")
usethis::use_build_ignore("dev_scratch")
usethis::use_mit_license(copyright_holder = "Vincent Beauregard")

usethis::use_dev_package("usethis", type = "Suggests", remote = NULL)
usethis::use_dev_package("testthat", type = "Suggests", remote = NULL)
usethis::use_dev_package("devtools", type = "Imports", remote = NULL)
usethis::use_dev_package("pkgdown", type = "Suggests", remote = NULL)
usethis::use_dev_package("rmarkdown", type = "Suggests", remote = NULL)

# Use packages for development in vscode environment
usethis::use_dev_package("languageserver", type = "Suggests", remote = NULL)
usethis::use_dev_package("vscDebugger", type = "Suggests",
    remote = "github::ManuelHentschel/vscDebugger")

# Use packages for development using Jupyter
usethis::use_dev_package("IRkernel", type = "Suggests", remote = NULL)

# Package dependencies
usethis::use_package("dplyr", type = "Imports")
usethis::use_package("httr", type = "Imports")
usethis::use_package("sf",  type = "Imports")
usethis::use_package("tidyr",  type = "Imports")
usethis::use_package("foreach",  type = "Imports")
usethis::use_package("doParallel", type = "Imports")

# Package modules and tests
usethis::use_r("get_gen")
usethis::use_test("get_gen")

usethis::use_r("post_gen")
usethis::use_test("post_gen")