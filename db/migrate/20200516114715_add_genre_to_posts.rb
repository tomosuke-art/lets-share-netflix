class AddGenreToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :genre, :string
  end
end
