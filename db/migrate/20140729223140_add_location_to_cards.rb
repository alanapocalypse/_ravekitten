class AddLocationToCards < ActiveRecord::Migration
  def change
    add_column :cards, :location, :string
    add_column :cards, :details, :text
    add_column :cards, :website, :string
  end
end
