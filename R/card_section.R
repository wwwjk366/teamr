#' Create a \code{card_section} Structure With \code{teamr}
#'
#' @description \code{card_section} creates an \code{Section} object which can be added to \code{connector_card}.
#'
#' @details Assemble \code{card_section} objects into a \code{action_card}
#' structure and use the methods to append, modify or send your card to the webhook specified.
#'
#' @docType class
#' @importFrom R6 R6Class
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{card_section$new()}}{Creates a new \code{card_section}.}
#'   \item{\code{text(sec_text)}}{Change the \code{text} field of the section.}
#'   \item{\code{title(sec_title)}}{Change the \code{title} field of the section.}
#'   \item{\code{activity_title(sec_activity_title)}}{Change the \code{title} field of the section.}
#'   \item{\code{activity_sub_title(sec_activity_subtitle)}}{Change the \code{subtitle} field of the section.}
#'   \item{\code{activity_image(sec_activity_image)}}{Change the \code{image} field of the section.}
#'   \item{\code{activity_text(sec_activitiy_text)}}{Change the \code{text} field of the section.}
#'   \item{\code{add_fact(fname, fvalue)}}{Add \code{fact} object to section.}
#'   \item{\code{add_link_button(btext, burl)}}{Add button with links.}
#'   \item{\code{add_image(sec_image, sec_title)}}{Change webhook address.}
#'   \item{\code{print()}}{Print out the current payload.}
#'   \item{\code{dump()}}{Dump current payload.}
#' }
#'
#' @section Properties:
#'
#' \describe{
#'  \item{\code{payload}}{R list of payloads(will be parsed into json)\link[httr]{POST}}
#' }
#'
#' @usage # sec <- card_section$new()
#'
#' @examples
#' \dontrun{
#' library(teamr)
#'
#' cc <- connector_card$new(hookurl = "https://outlook.office.com/webhook/...")
#' cc$text("Of on affixed civilly moments promise explain")
#' pa <- action_card$new(type = "ActionCard", name = "Add comment")
#' pa$add_actions()
#' pa$add_text_inputs(id = "comment", title = "Add comment for this task", is_multi_line = TRUE)
#' cc$add_potential_action(pa)
#' cc$send()
#' }
#'
#' @export
#' @format An \code{\link{R6Class}} generator object
card_section <- R6Class("card_section", list(
  payload = list(),

  initialize = function() {
  },

  print = function(...) {
    cat("Section: \n")
    cat("  payload:  ", jsonlite::toJSON(self$payload,auto_unbox = TRUE),  "\n", sep = "")
    invisible(self)
  },

  title = function(sec_title){
    self$payload$title <- sec_title
  },

  text = function(sec_text){
    self$payload$text <- sec_text
  },

  activity_title = function(sec_activity_title){
    self$payload$activityTitle <- sec_activity_title
  },

  activity_sub_title = function(sec_activitiy_subtitle){
    self$payload$activitySubtitle <- sec_activitiy_subtitle
  },

  activity_image = function(sec_activitiy_image){
    self$payload$activityImage <- sec_activitiy_image
  },

  activity_text = function(sec_activitiy_text){
    self$payload$activityText <- sec_activitiy_text
  },

  add_fact = function(fname, fvalue){

    if(!exists('facts', where=self$payload)) self$payload$facts = list()

    new_fact = list(
      name = fname,
      value = fvalue
    )

    self$payload$facts <- append(self$payload$facts,list(new_fact))

  },

  add_link_button = function(btext, burl){

    if(!exists('potentialAction', where=self$payload)) self$payload$potentialAction = list()
    thisbutton = list(
      `@context` = "http://schema.org",
      `@type` = "ViewAction",
      name = btext,
      target = list(burl)
    )
    self$payload$potentialAction <- append(self$payload$potentialAction,list(thisbutton))
  },

  add_image = function(sec_image, sec_title = NULL){

    if(!exists('images', where=self$payload)) self$payload$images = list()

    thisimage = list(
      image = sec_image
    )
    if(!is.null(sec_title)) thisimage$title = sec_title
    self$payload$images <- append(self$payload$images,list(thisimage))

  },

  dump = function(){
    return(self$payload)
  }
))

