class AddTrailRefToNodes < ActiveRecord::Migration[6.1]
  def change
    add_reference :nodes, :trail, null: false, foreign_key: true
  end
end
