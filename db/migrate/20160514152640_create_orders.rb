class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :wants_ring
      t.boolean :wants_wallet
      t.integer :ring_amount
      t.integer :wallet_amount
      t.text :note

      t.timestamps null: false
    end
  end
end
