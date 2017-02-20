class RemoveWhereColumn < ActiveRecord::Migration
  def change
  	remove_column :users, :where
  	add_column :users, :revenue, :decimal
  end
end
