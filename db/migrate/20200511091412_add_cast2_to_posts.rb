class AddCast2ToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :cast2, :string
  end
end
