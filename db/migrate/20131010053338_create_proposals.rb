class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :make
      t.string :model_name
      t.string :papers
      t.integer :mileage
      t.integer :year_built
      t.integer :displacement
      t.string :place
      t.string :price
      t.datetime :date_published
      t.string :link
      t.text :description
      t.string :contacts
      t.datetime :date_presence_checked
      t.datetime :date_vanished
      t.timestamps
    end
  end
end
