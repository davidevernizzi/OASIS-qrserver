class Operation < ActiveRecord::Base
  belongs_to :badge
  attr_accessible :description, :name, :url
end
