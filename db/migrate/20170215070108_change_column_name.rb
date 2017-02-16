class ChangeColumnName < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.rename :InternationalShippingFee, :international_shipping_fee
  	end
  end
end
