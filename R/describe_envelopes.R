#' Describe envelopes
#'
#' The function downloads and returns a list or dataframe containing a
#' description for each requested species distribution envelope where a row
#' corresponds to a record. The function returns a dataframe for all envelopes
#' if no parameters are specified. The function filters returned envelopes
#' record by attributes corresponding to io table columns specified as
#' parameters (ie. `id`, `taxa_scientific_name`, `scenario`, `year`, etc)
#' with accepted values either being scalar or vector for single or multiple
#' records
#'

#' @param ... Optional. scalar or vector. Returns a dataframe filtered by the
#' io `envelopes` table columns specified as parameter
#'
#' @return `tibble` with rows associated with IO data object
#'
#' @examples
#' # Returns all available envelopes records in io
#' envelopes <- describe_envelopes()
#'
#' # Returns all envelopes filtered by the column `original_source`
#' envelopes <- describe_envelopes(taxa_scientific_name = "Binto binto")
#'
#' @export

describe_envelopes <- function(
  ...
) {
  query <- list(...)
  query$endpoint <- "envelopes"
  query$.schema <- "public"
  query$select <- "id, taxa_scientific_name, category, scenario, year, threshold_desc, created_at, modified_at"

  envelopes <- do.call(get_gen, query)
  return(envelopes)
}