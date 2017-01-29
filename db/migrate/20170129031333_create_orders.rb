class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :ItemID
      t.integer :CustomerID
      t.integer :UserID
      t.decimal :InternationalShippingFee
      t.decimal :DomesticShippingFee
      t.decimal :ExchangeRate
      t.decimal :Price
      t.integer :From
      t.integer :Status
      t.decimal :Refund
      t.date :CompletedDate

      t.timestamps null: false
    end
  end
end
