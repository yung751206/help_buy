class AddIndexToRevenue < ActiveRecord::Migration
  def change
  	add_index :orders, :revenue
  end
end
