class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :paid, default: false
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
