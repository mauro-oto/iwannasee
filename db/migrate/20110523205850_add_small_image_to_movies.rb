class AddSmallImageToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :small_image, :string
  end

  def self.down
    remove_column :movies, :small_image
  end
end
