class RemoveRevenueColumnFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :revenue
  	remove_column :orders, :where
  	add_column :orders, :revenue, :decimal
  end
end
