class AddSeenToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :seen, :boolean
  end

  def self.down
    remove_column :movies, :seen
  end
end
