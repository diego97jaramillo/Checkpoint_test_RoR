class AddCascadeToComments < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :comments, :posts
    add_foreign_key :comments, :posts, on_delete: :cascade
  end
end

