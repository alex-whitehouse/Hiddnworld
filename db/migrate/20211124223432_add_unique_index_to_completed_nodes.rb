class AddUniqueIndexToCompletedNodes < ActiveRecord::Migration[6.1]
  
  def change
    add_index :completed_nodes, [:user_id, :node_id], unique: true
  end
  
end
