class AddWhereColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :where, :integer
  end
end
