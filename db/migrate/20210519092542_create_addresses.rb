class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order, foreign_key: true
      t.string     :postal_code,     null: false
      t.integer    :prefecture_id




      t.timestamps
    end
  end
end
