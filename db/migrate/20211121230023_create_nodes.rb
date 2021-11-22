class CreateNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :nodes do |t|
      t.string :question
      t.string :answer
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
