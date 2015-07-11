class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status, default: 1
      t.integer :merchant_id

      t.timestamps
    end
  end
end
