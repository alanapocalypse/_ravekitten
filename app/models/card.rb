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

	# Date stuff
	def display_date
		return "" unless start_date
    if end_date
        if start_date.month != end_date.month
          start_date.strftime("%B %d - ") + end_date.strftime("%B %d %Y")
        else
          start_date.strftime("%B %d - ") + end_date.strftime("%d %Y")
        end
    else
      start_date.strftime("%B %d %Y")
    end
  end

  def daysleft
  	(Date.today - start_date).to_i
  end

  def countdown
  	if daysleft < 0
  		"#{daysleft.abs} days"
  	end
  end

  def over?
  	daysleft >= 0
  end

end
