class CreateSoldUsersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sold_users_items do |t|

      t.timestamps
    end
  end
end
