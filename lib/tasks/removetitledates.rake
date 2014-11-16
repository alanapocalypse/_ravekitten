task :removetitledates => :environment do
	Card.all.each{|c| c.update_attribute(:title, c.title.gsub(/ \d+/,''))}
end