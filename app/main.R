
box::use(
  shiny[bootstrapPage, div, moduleServer, NS, renderUI, tags, uiOutput],
  rhino[rhinos],
  janitor = janitor[clean_names],
)

box::use(
  app/view/chart,
  app/view/table,
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    table$ui(ns("table")),
    chart$ui(ns("chart"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    data_app <- rhinos |> janitor$clean_names()
    table$server("table", data = data_app)
    chart$server("chart", data = data_app)
  })
}
