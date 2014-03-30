class User < ActiveRecord::Base
	has_secure_password
	has_many :checkins, :dependent => :destroy
	has_many :answers, :dependent => :destroy
	require 'csv'

	def admin?
		user_type == "admin"
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			User.create!(row.to_hash)
		end
	end
end
