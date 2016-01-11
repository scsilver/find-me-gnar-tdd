class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :from
      t.string :to
      t.float :distance
      t.float :traffic_time
      t.string :hazards

      t.timestamps null: false
    end
  end
end
