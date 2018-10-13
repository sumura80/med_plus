class AddCounterLikeToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :likes_count, :int, default: 0
  end
end
