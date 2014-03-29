class Checkin < ActiveRecord::Base
	belongs_to :user
	has_many :answers


	def perseverance_score
		answers = select_answers(3)
		answers.map(&:option).map(&:value).reduce(:+).fdiv(answers.count)
	end

	def respect_humility_score
		answers = select_answers(1)
		answers.map(&:option).map(&:value).reduce(:+).fdiv(answers.count)
	end

	def integrity_score
		answers = select_answers(2)
		answers.map(&:option).map(&:value).reduce(:+).fdiv(answers.count)
	end

	def team_love_family_score
		answers = select_answers(6)
		answers.map(&:option).map(&:value).reduce(:+).fdiv(answers.count)
	end

	def passion_score
		answers = select_answers(4)
		answers.map(&:option).map(&:value).reduce(:+).fdiv(answers.count)
	end

	def empowerment_score
		answers = select_answers(5)
		answers.map(&:option).map(&:value).reduce(:+).fdiv(answers.count)
	end

	def select_answers(core_value_id)
		self.answers.select { |a| a if a.question.core_value.id == core_value_id}
	end
end
