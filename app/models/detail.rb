class Detail < ActiveRecord::Base
  belongs_to :badge
  attr_accessible :kind, :value
end
