class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :stock_name
      t.string :stock_symbol
      t.float :stock_price
      t.integer :shares

      t.timestamps
    end
  end
end
