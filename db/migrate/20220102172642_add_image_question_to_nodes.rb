class AddImageQuestionToNodes < ActiveRecord::Migration[6.1]
  def change
    add_column :nodes, :image_question, :boolean, default: false
  end
end
