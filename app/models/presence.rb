class Presence < ActiveRecord::Base
  belongs_to :badge
  attr_accessible :created_by, :value
end
