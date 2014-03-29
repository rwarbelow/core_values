class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string   :username, :null => false
			t.string   :password_digest, :null => false
			t.string   :first_name, :null => false
			t.string   :last_name, :null => false
			t.integer  :grade_level
			t.string   :user_type
			t.timestamps
		end
	end
end
