class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.integer :status, default: 1
      t.text :about
      t.integer :gender
      t.float :price
      t.integer :review_count
      t.float :avg_rating
      t.integer :session_time

      t.timestamps
    end
  end
end
