class AddTimestamps < ActiveRecord::Migration
  add_column :handles, :created_at, :datetime
  add_column :handles, :updated_at, :datetime
  add_column :tweets, :created_at, :datetime
  add_column :tweets, :updated_at, :datetime
end
