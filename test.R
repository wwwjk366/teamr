cc <- connector_card$new(hookurl = "https://outlook.office.com/webhook/3df58884-d979-409c-a50a-6b13e3bfd6cb@d78aee32-8f91-4f9e-90ea-fb72965d9d7c/IncomingWebhook/a9d73932df4f4d20b3dd57ae9b4b96cb/dba232ed-dcf2-4767-a170-a56562ef8a99")

cc$text("Anthony Davis almost immediately was put to work upon joining the Los Angeles Lakers. The Lakers, who acquired Davis in a blockbuster trade with the New Orleans days prior to the 2019 NBA Draft, reportedly had a desire to add a third superstar this summer: Kawhi Leonard. Ultimately, Leonard did return home to Los Angeles, but he opted to sign with the Clippers instead of teaming up with Davis and LeBron James")
cc$title("Anthony Davis Jokes About Trying To Recruit Kawhi Leonard To Lakers")
cc$summary("This is a summary")
cc$add_link_button("Read more ", "https://nesn.com/2019/07/anthony-davis-jokes-about-trying-to-recruit-kawhi-leonard-to-lakers/")
cc$color("#008000")





sec <- teamr::card_section$new()
sec$text("2018-19 Finals MVP")
sec$activity_sub_title("Kawhi Leonard")
sec$add_fact("Position", "Forward")
sec$title("Player Info")
sec$add_image(sec_image = "https://d2cwpp38twqe55.cloudfront.net/req/201905091/images/players/leonaka01.jpg", sec_title = "so funny")

sec$activity_image("https://d2cwpp38twqe55.cloudfront.net/req/201905091/images/players/leonaka01.jpg")
sec$activity_title("Activity Title")
sec$activity_sub_title("Activity Subtitle")
sec$activity_text("Activity text")

cc$add_section(new_section = sec)

pa <- potential_action$new(type = "ActionCard", name = "Add comment")
pa$add_actions()
pa$add_text_inputs(id = "comment", title = "Add comment for this task", is_multi_line = TRUE)

cc$add_potential_action(pa)
cc$print()


cc$send()


library(tidyverse,quietly = TR)
