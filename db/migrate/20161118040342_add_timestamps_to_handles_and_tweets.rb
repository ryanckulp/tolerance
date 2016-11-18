class AddTimestampsToHandlesAndTweets < ActiveRecord::Migration
  def change_table
    add_column(:handles, :created_at, :datetime)
    add_column(:handles, :created_at, :datetime)
    add_column(:tweets, :updated_at, :datetime)
    add_column(:tweets, :updated_at, :datetime)
  end
end
