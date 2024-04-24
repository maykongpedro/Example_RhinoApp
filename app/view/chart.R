
# Load modules ------------------------------------------------------------
box::use(
  echarts4r,
  shiny[h3, moduleServer, NS, tagList]
)

box::use(
  app/logic/chart_utils[label_formatter],
)



# Ui ----------------------------------------------------------------------
#' @export
ui <- function(id) {

  ns <- NS(id)
  tagList(
    h3("Chart"),
    echarts4r$echarts4rOutput(ns("chart"))
  )

}

# Server ------------------------------------------------------------------
#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {

    output$chart <- echarts4r$renderEcharts4r(
      data |>
        echarts4r$group_by(species) |>
        echarts4r$e_chart(x = year) |>
        echarts4r$e_line(serie = population) |>
        echarts4r$e_x_axis(
          serie = year,
          axisLabel = list(
            # change numbers format
            formatter = label_formatter
          )
        ) |>
        echarts4r$e_tooltip()
    )

  })
}
