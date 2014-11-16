# agent.page.links_with(:text => /Festival/)
# event =  agent.page.link_with(:text => /Festival/).click
# info = event.at("#event-title-details")
# info.match(/([A-Z].*\d)/).to_s.to_date
# event.at(".event-title").text.split(" ")
# stuff = event.at(".event-title").text.split(" ").drop(1)
# => ["Electric", "Zoo", "–", "New", "York", "City,", "N.Y."]
# delete = stuff.find_index{|x| ! x.ascii_only?}

# agent.page.links_with(:href => /\/festival/) each do |event|
# 	link_title = event.text.split.drop(1).take_while{|x| x.ascii_only?}.join(" ")

# events = agent.page.search(".singleEventWide")
# events.each do |i|
# 	i.at(".eventTitleWide")
# 	i.at(".eventDateWide")
# end