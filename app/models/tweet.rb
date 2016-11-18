class Tweet < ActiveRecord::Base
  belongs_to :handle
  serialize :media, Array
end
