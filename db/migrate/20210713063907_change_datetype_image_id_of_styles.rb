class ChangeDatetypeImageIdOfStyles < ActiveRecord::Migration[5.2]
  def change
    change_column :styles, :image_id, :string
  end
end
