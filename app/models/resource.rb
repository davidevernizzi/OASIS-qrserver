class Resource < ActiveRecord::Base
  attr_accessible :name

  has_many :attributes
end
