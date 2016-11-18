class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.text :query
      t.timestamps null: false
    end
  end
end
