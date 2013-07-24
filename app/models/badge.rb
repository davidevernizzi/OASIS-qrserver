class Badge < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :details
  has_many :presences
end
