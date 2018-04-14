class CreateVoteRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_records do |t|
      t.references :user, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
