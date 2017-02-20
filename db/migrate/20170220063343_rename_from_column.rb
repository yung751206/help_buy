class RenameFromColumn < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.rename :from, :origin
  	end	
  end
end
