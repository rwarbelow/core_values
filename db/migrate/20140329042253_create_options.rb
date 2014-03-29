class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
    	t.string :option
    	t.integer :value
      t.timestamps
    end
  end
end
