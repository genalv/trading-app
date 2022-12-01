class AddSymbolPriceValueToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :stock_symbol, :string
    add_column :transactions, :stock_price, :float
    add_column :transactions, :value, :float
  end
end
