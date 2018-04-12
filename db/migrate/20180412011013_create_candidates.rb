class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :main_image_data
      t.text :description
      t.text :pledge
      t.text :policy

      t.timestamps
    end
  end
end
