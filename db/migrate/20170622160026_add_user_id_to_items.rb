class AddUserIdToItems < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.integer :user_id
    end
  end
end
