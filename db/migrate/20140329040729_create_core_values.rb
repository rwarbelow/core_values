class CreateCoreValues < ActiveRecord::Migration
  def change
    create_table :core_values do |t|
    	t.string :name
      t.timestamps
    end
  end
end
