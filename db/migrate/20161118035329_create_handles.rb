class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.string :screen_name
      t.string :name
      t.text :avatar
    end
  end
end
