class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :genre_id
      t.string :details
      t.datetime :date_uploaded
    end
  end
end
