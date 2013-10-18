class AddVehicleTypesToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :vehicle_type, :string, limit: 20
  end
end
