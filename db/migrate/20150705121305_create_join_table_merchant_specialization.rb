class CreateJoinTableMerchantSpecialization < ActiveRecord::Migration
  def change
    create_join_table :merchants, :specializations, column_options: {null: true} do |t|
    end
  end
end
