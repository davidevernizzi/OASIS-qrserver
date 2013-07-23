class Attribute < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :description, :name, :atype, :value
end
