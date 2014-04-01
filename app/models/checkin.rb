class Checkin < ActiveRecord::Base
	belongs_to :user
	has_many :answers, :dependent => :destroy
	has_many :comments, :dependent => :destroy

	def get_score(core_value_id)
		answers = select_answers(core_value_id)
		answers.map(&:value).reduce(:+).fdiv(answers.count).round(1)
	end

	def select_answers(core_value_id)
		self.answers.select { |a| a if a.question.core_value.id == core_value_id}
	end

	def self.gather_last_five(user_id, core_value_id, checkins)
		a = []
		checkins.each do |c|
			a << c.get_score(core_value_id)
		end
		a
	end

	def self.invalid?(responses)
		responses.flatten.include?("") || responses.flatten.include?("0") || responses.count != 47
	end

	def self.get_last_five_checkins(user_id)
		where(user_id: user_id).last(8).reverse
	end

	def self.gather_last_five_dates(user_id, checkins)
		a = []
		checkins.each do |c|
			a << c.created_at
		end
		a
	end

	def total_score
		answers.map(&:value).reduce(:+).fdiv(answers.count).round(1)
	end

	def self.gather_last_five_total_scores(user_id, checkins)
		a = []
		checkins.each do |c|
			a << c.total_score
		end
		a
	end

	def self.get_last_five_comments(student_id, checkins)
		a = []
		checkins.each do |c|
			c.comments.each do |m|
				a << m if m.user_id == student_id
			end
		end
		a
	end
end
