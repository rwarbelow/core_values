class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.references :user
    	t.references :checkin
    	t.references :question
    	t.references :option
    	t.integer :value
      t.timestamps
    end
  end
end
