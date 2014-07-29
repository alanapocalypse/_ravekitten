class Card < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
