class AddPostIdToComment < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :post, null: true, foreign_key: true
  end
end
