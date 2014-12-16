class RemoveDateUploadedFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :date_uploaded, :datetime
  end
end
