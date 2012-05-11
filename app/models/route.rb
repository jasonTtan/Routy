class Route < ActiveRecord::Base
  attr_accessible :name
  validates :name,  :presence => true
  
  has_many :destinations
  has_many :comments
end
