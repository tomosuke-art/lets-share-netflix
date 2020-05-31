class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :released_year, :integer
    add_column :posts, :summary, :text
    add_column :posts, :director, :string
    add_column :posts, :cast, :string
  end
end
