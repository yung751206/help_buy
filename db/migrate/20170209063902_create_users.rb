class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
