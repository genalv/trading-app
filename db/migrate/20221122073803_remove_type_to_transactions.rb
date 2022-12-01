class RemoveTypeToTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :type
  end
end
