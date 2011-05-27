class AddUserIdToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :user_id, :integer
  end

  def self.down
    remove_column :movies, :user_id
  end
end
