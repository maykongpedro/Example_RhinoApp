
box::use(
  dplyr[arrange],
  tidyr[pivot_wider],
)

#' @export
transform_data <- function(data) {

  data |>
    pivot_wider(
      names_from = species,
      values_from = population
    ) |>
    arrange(year)

}
