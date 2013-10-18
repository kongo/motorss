class AddIndexUinOnProposals < ActiveRecord::Migration
  def change
    add_index :proposals, :uin
  end
end
