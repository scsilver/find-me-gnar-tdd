class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|

      t.timestamps null: false
    end
  end
end
