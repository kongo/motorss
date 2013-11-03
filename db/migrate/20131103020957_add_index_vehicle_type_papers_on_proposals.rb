class AddIndexVehicleTypePapersOnProposals < ActiveRecord::Migration
  def change
    add_index :proposals, [:vehicle_type, :papers]
  end
end
