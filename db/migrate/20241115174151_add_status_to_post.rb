class AddStatusToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :status, :boolean
  end
end
