class User < ActiveRecord::Base
  has_secure_password
  has_many :checkins
  has_many :answers
end
