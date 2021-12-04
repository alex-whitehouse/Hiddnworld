class AddHintToNodes < ActiveRecord::Migration[6.1]
  def change
    add_column :nodes, :hint, :string
  end
end
