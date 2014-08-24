class AddLineupToCards < ActiveRecord::Migration
  def change
    add_column :cards, :lineup, :text
    add_column :cards, :tickets, :string
  end
end
