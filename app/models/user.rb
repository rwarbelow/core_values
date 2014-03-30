class User < ActiveRecord::Base
  has_secure_password
  has_many :checkins
  has_many :answers

  def admin?
  	user_type == "admin"
  end

  def full_name
  	"#{first_name} #{last_name}"
  end
end
