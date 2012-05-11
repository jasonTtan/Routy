class Comment < ActiveRecord::Base
  belongs_to :route
  attr_accessible :body, :commenter
end
