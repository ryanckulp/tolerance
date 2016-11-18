class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.text :link
      t.text :media
      t.integer :likes
      t.references :handle, index: true, foreign_key: true
    end
  end
end
