class RenameShippingFromIdToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_from_id, :prefecture_id
  end
end
