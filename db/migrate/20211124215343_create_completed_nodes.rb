class CreateCompletedNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_nodes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :node, null: false, foreign_key: true

      t.timestamps
    end
  end
end
