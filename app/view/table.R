
box::use(
  reactable,
  shiny[h3, moduleServer, NS, tagList],
)

box::use(
  app/logic/data_transformation[transform_data]
)


#' @export
ui <- function(id) {

  ns <- NS(id)

  tagList(
    h3("Table"),
    reactable$reactableOutput(ns("table"))
  )

}


#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {

    output$table <- reactable$renderReactable(

      data |>
        transform_data() |>
        reactable$reactable()

    )

  })
}


