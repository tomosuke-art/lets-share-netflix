class AddCast3ToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :cast3, :string
  end
end
