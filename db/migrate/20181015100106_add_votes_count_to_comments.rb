class AddVotesCountToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :votes_count, :int, default: 0
  end
end
