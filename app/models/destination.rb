class Destination < ActiveRecord::Base
  belongs_to :route
  attr_accessible :destID, :name
end
