desc "Scrape MFJ"
task :scrape_mfj => :environment do
	require 'mechanize'
	require 'chronic'
	require 'open-uri'
	url = "http://www.musicfestivaljunkies.com/festival-genre/electronic/"
	agent = Mechanize.new
	agent.get(url)
	loop do
		agent.page.search(".singlefestlisting").each do |event|
			title = event.at(".festivaltitle").text.gsub(/\d{4}/, "")
			festdate = event.at(".festivaldate").text.split(/\W/).reject! {|x| x.empty?}
			start_date = festdate.take(2).push(festdate.last).join(" ")
			end_date = festdate.take(1).push(festdate.last(2)).join(" ")
			if festdate.length == 3
				end_date = nil
			end
			card = Card.where(title: title).where(start_date: start_date).first_or_create!
			card.location = event.at(".festivallocation").text
			card.start_date = start_date
			card.end_date = end_date
			card.save!
		end

		urls = agent.page.links_with(:href => /(\/festivals\/)/)
		urls.each do |eventurl|
			fest = Nokogiri::HTML(open(eventurl.href))
			title = fest.at_css(".single-title").text.strip

			card = Card.find_by!(title: title)
			card.lineup = fest.css(".lineupguide").text.split(/\n/).drop(2).join(", ")
			card.website = fest.at('a:contains("Official Site")')["href"]
			card.save!
		end

		link = agent.page.at(".next")

		if link
			url = agent.click(link)
		else
			break
		end
	end

end

# :location => location, :start_date => Chronic.parse(startdate), :end_date => Chronic.parse(enddate))