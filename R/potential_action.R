#' Create a \code{action_card} Structure With \code{teamr}
#'
#' @description \code{action_card} creates an \code{potentialAction} object which can be added to \code{connector_card}.
#'
#' @details Assemble \code{action_card} objects into a \code{action_card}
#' structure and use the methods to append, modify or send your card to the webhook specified.
#'
#' @docType class
#' @importFrom R6 R6Class
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{action_card$new(type, name)}}{Creates a new \code{action_card}.}
#'   \item{\code{add_text_inputs(id, title, is_multiline)}}{Add \code{TextInput} to your \code{action_card} reponses }
#'   \item{\code{add_date_inputs(id, title)}}{Add \code{DateInput} to your \code{action_card} reponses }
#'   \item{\code{add_mchoice_inputs(id, title, is_multi_select)}}{Add \code{MultichoiceInput} to your \code{action_card} reponses }
#'   \item{\code{dump()}}{Dump current payload}
#' }
#'
#' @section Properties:
#'
#' \describe{
#'  \item{\code{payload}}{R list of payloads(will be parsed into json)\link[httr]{POST}}
#' }
#'
#' @usage # ac <- action_card$new(type = "ActionCard", name = "Add comment")
#'
#' @examples
#' \dontrun{
#' library(teamr)
#'
#' cc <- connector_card$new(hookurl = "https://outlook.office.com/webhook/...")
#' cc$text("Of on affixed civilly moments promise explain")
#' sec$text("2018-19 Finals MVP")
#' sec$activity_sub_title("Kawhi Leonard")
#' sec$add_fact("Position", "Forward")
#' sec$title("Player Info")
#' sec$add_image(sec_image = "https://d2cwpp38twqe55.cloudfront.net/req/201905091/images/players/leonaka01.jpg", sec_title = "so funny")
#' sec$activity_image("https://d2cwpp38twqe55.cloudfront.net/req/201905091/images/players/leonaka01.jpg")
#' sec$activity_title("Activity Title")
#' sec$activity_sub_title("Activity Subtitle")
#' sec$activity_text("Activity text")
#' cc$add_section(new_section = sec)
#' cc$print()
#' cc$send()
#' }
#'
#' @export
#' @format An \code{\link{R6Class}} generator object
action_card <- R6Class("action_card", list(

  payload = list(),

  initialize = function(type, name) {
    self$payload$`@type` = type
    self$payload$name  = name
  },


  add_actions = function(type = "HttpPOST", name = "Save", target = "http://..."){

    if(!exists('actions', where=self$payload)) self$payload$actoins = list()
    thisaction = list(
      `@type` = type,
      name = name,
      target = target
    )
    self$payload$actions <- append(self$payload$actions, list(thisaction))
  },

  add_text_inputs = function(id, title, is_multi_line) {
    if(!exists('inputs', where=self$payload)) self$payload$inputs = list()
    thisinput = list(
      `@type` = "TextInput",
      id = id,
      title = title,
      isMultiline = ifelse(is_multi_line, "true", "false")
    )
    self$payload$inputs <- append(self$payload$inputs, list(thisinput))
  },

  add_date_inputs = function(id, title) {
    if(!exists('inputs', where=self$payload)) self$payload$inputs = list()
    thisinput = list(
      `@type` = "DateInput",
      id = id,
      title = title
    )
    self$payload$inputs <- append(self$payload$inputs, list(thisinput))
  },

  add_mchoice_inputs = function(id, title, is_multi_select, choices) {
    if(!exists('inputs', where=self$payload)) self$payload$inputs = list()
    thisinput = list(
      `@type` = "MultichoiceInput",
      id = id,
      title = title,
      isMultiSelect = ifelse(is_multi_select, "true", "false"),
      choices = choices
    )
    self$payload$inputs <- append(self$payload$inputs, list(thisinput))
  },

  dump = function(){
    return(self$payload)
  }

))
