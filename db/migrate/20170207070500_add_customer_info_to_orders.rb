class AddCustomerInfoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :CustomerFirstName, :string
    add_column :orders, :CustomerLastName, :string
    add_column :orders, :CustomerPhone, :string
    add_column :orders, :CustomerAddress, :string
    add_column :orders, :Brand, :string
    add_column :orders, :Cost, :decimal
    add_column :orders, :Description, :string
  end
end
