#' Post envelopes
#'
#' The function upload a species distribution model's envelope with related
#' information described as arguments to be stored in IO database.
#'
#' @param geom_ewkt `string`. Polygon or Multipolygon geometry
#' as Extended Well Known Text (EWKT) format with WGS84 as coordinate system
#' (SRID = 4326)
#' @param category `string`. One of either values `current` or `projected`.
#' Describes if envelopes are modeled at `current` observations and environment
#' variables or `projected` in future conditions.
#' @param taxa_scientific_name `string`. Scientific name of organism for which
#' the distribution is modeled.
#' @param year `integer`. Reference year for `current` or `projected`
#' distribution envelope.
#' @param scenario `string` Optional. Name of the scenarion describing projected
#' environment variables.
#' @param threshold_desc `string` Optional. Name or short description for SDM
#' thresholding methodology to generate a binary.
#'
#' @return NULL when successful
#'
#' @examples
#' # Insert a small enveloppe for the newly discovered species `Binto binto`
#' response <- post_envelopes(
#'  geom_ewkt = "SRID=4326;POLYGON((-76.355 37.009,-76.350 37.010,-76.349 37.001,-76.354 37.001,-76.355 37.009))",
#'  category = "current",
#'  taxa_scientific_name = "Binto binto",
#'  year = 2022,
#'  scenario = NULL,
#'  threshold_desc = NULL
#' )
#' @export

post_envelopes <- function(geom_ewkt,
                           category,
                           taxa_scientific_name,
                           year,
                           scenario = NULL,
                           threshold_desc = NULL) {
    data <- list()
    data$geom <- geom_ewkt
    data$category <- category
    data$taxa_scientific_name <- taxa_scientific_name
    data$year <- year
    data$scenario <- scenario
    data$threshold_desc <- threshold_desc

    header <- list("Prefer" = "resolution=merge-duplicates")

    response <- post_gen(
        data = data,
        endpoint = "envelopes",
        .schema = "public",
        .header = header,
        on_conflict = "taxa_scientific_name, category, year, scenario, threshold_desc") # nolint
    return(response)
}