class CreateVisitRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :visit_records do |t|
      t.date :day
      t.integer :count

      t.timestamps
    end
  end
end
