class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :checkin
	belongs_to :question
	belongs_to :option

	def core_value_id
		self.question.core_value.id
	end
end
