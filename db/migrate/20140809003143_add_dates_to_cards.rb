class AddDatesToCards < ActiveRecord::Migration
  def change
    add_column :cards, :start_date, :date
    add_column :cards, :end_date, :date
  end
end
