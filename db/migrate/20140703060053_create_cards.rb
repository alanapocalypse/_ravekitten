class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :image
      t.date :event_date

      t.timestamps
    end
  end
end
