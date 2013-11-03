class AddLocationToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :location, :string, limit: 30
  end
end
