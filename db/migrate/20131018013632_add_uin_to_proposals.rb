class AddUinToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :uin, :integer, null: false
  end
end
