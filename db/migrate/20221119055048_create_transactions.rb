class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.string :company_name
      t.integer :shares
      t.float :share_price

      t.timestamps
    end
  end
end
