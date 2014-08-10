class Card < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			card = find_or_create_by!( title: row["title"])
			card.start_date = Date.parse(row["start_date"])
			unless row["end_date"].nil?
				card.end_date = Date.parse( row["end_date"])
			end
			card.attributes = row.to_hash
			card.save!
		end
	end

end
