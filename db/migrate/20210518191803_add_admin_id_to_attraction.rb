class AddAdminIdToAttraction < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :admin_id, :integer
  end
end
