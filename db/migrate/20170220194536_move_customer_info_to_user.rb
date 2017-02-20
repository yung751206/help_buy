class MoveCustomerInfoToUser < ActiveRecord::Migration
  def change
  	remove_column :orders, :customer_first_name
  	remove_column :orders, :customer_last_name
  	remove_column :orders, :customer_phone
  	remove_column :orders, :customer_address
  	add_column :users, :customer_address, :string
  	add_column :users, :customer_phone, :string
  	add_column :users, :customer_last_name, :string
  	add_column :users, :customer_first_name, :string
  end
end
