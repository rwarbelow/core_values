class Question < ActiveRecord::Base
	has_many :answers
	has_many :options, :through => :answers
	belongs_to :core_value
end
