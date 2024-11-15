class AddCascadeDeleteToPosts < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :posts, :users
    add_foreign_key :posts, :users, on_delete: :cascade
  end
end
