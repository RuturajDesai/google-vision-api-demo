class CreateImageLists < ActiveRecord::Migration[6.0]
  def change
    create_table :image_lists do |t|
      t.json :text_data
      t.string :image_name
      t.string :image_path

      t.timestamps
    end
  end
end
