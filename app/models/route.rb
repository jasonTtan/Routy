class Route < ActiveRecord::Base
  attr_accessible :name
  validates :name,  :presence => true
  
  has_many :destinations, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
