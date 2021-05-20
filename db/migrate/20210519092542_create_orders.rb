class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :sold_users_item, foreign_key: true
      t.timestamps
    end
  end
end
