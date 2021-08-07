class RenameListIdColumnToTags < ActiveRecord::Migration[5.2]

  def change
    rename_column :tags, :list_id, :style_id
  end
end
