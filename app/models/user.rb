class User < ActiveRecord::Base
	has_secure_password

	validates_uniqueness_of :email

	def self.from_omniauth(auth)
		where(auth.slice("provider","uid")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["nickname"]
			user.password = SecureRandom.urlsafe_base64
		end
	end
end
