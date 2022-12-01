class AddActionTypeToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :action_type
  end
end
