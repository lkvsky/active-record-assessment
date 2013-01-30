class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.integer :song_id
      t.integer :band_id

      t.timestamp
    end
  end
end
