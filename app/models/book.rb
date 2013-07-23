class Book < ActiveRecord::Base
  belongs_to :library
  attr_accessible :author, :title
end
