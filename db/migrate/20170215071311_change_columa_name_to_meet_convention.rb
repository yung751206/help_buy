class ChangeColumaNameToMeetConvention < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.rename :DomesticShippingFee, :domestic_shipping_fee
  		t.rename :ExchangeRate, :exchange_rate
  		t.rename :Price, :price
  		t.rename :From, :from
  		t.rename :Status, :status
  		t.rename :Refund, :refund
  		t.rename :CompletedDate, :completed_date
  		t.rename :CustomerFirstName, :customer_first_name
  		t.rename :CustomerLastName, :customer_last_name
  		t.rename :CustomerPhone, :customer_phone
  		t.rename :CustomerAddress, :customer_address
  		t.rename :Brand, :brand
  		t.rename :Cost, :cost
  		t.rename :Description, :description
  	end	
  end
end
