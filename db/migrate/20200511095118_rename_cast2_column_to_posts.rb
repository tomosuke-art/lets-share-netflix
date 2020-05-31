class RenameCast2ColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :cast2, :casta
  end
end
