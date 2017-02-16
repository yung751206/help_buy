class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :orders, :ItemID
  	remove_column :orders, :CustomerID
  end
end
