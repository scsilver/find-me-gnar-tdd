class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :location
      t.string :station
      t.integer :base
      t.float :temp
      t.integer :snowfall_24hr
      t.float :rating
      t.string :webcam
      t.string :site
      t.string :symbol
      t.string :s_xpath_base
      t.string :s_url
      t.string :s_xpath_24hr

      t.timestamps null: false
    end
  end
end
