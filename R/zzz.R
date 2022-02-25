IO_API_HOST <- function() {
    env_host <- Sys.getenv("IO_API_HOST")
    if (nchar(env_host) > 0) {
        return(env_host)
    } else {
        return("https://atlas.biodiversite-quebec.ca/io/api/v1")
    }
}

BDQC_API_TOKEN <- function() Sys.getenv("BDQC_API_TOKEN")

USER_AGENT <- function() "IO_r_package"