class AddLikesCounterToPost < ActiveRecord::Migration[5.1]
  def change
  	# counter_cacheを使っていたためpostにカラムを追加
  	add_column :posts, :likes_count, :int, default: 0
  end
end
