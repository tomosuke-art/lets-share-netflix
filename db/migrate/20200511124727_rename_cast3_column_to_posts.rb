class RenameCast3ColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :cast3, :castb
  end
end
