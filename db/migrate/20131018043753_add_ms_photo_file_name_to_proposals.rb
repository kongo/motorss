class AddMsPhotoFileNameToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :ms_photo_file_name, :string, limit: 40
  end
end
