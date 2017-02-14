class RemoveUserIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :UserID, :integer
  end
end
