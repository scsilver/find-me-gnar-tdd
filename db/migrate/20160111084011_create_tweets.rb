class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :content
      t.string :time
      t.references :resort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
