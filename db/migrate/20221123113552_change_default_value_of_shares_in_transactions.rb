class ChangeDefaultValueOfSharesInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column_default :transactions, :shares, 0
  end
end
