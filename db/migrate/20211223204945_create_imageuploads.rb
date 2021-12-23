class CreateImageuploads < ActiveRecord::Migration[6.1]
  def change
    create_table :imageuploads do |t|
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
