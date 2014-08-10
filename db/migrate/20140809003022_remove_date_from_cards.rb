class RemoveDateFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :event_date, :date
  end
end
