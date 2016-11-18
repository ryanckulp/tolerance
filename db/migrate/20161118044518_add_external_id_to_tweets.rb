class AddExternalIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :external_id, :string
  end
end
