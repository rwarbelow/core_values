class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
    	t.references :user
      t.timestamps
    end
  end
end
