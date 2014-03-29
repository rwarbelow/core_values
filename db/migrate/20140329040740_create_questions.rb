class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :question
    	t.references :core_value
      t.timestamps
    end
  end
end
