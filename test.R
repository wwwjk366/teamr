cc <- connector_card$new(hookurl = "https://outlook.office.com/webhook/3df58884-d979-409c-a50a-6b13e3bfd6cb@d78aee32-8f91-4f9e-90ea-fb72965d9d7c/IncomingWebhook/a9d73932df4f4d20b3dd57ae9b4b96cb/dba232ed-dcf2-4767-a170-a56562ef8a99")

cc$text("Of on affixed civilly moments promise explain")
cc$title("This is a title")
cc$summary("This is a summary")
cc$add_link_button("This is the button Text", "https://github.com/wwwjk366/teamr/")
cc$add_link_button("This is 2 the button Text", "https://github.com/wwwjk366/teamr/")
cc$color("#008000")
cc$print()
cc$send()

