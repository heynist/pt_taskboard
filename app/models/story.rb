class Story < ActiveRecord::Base
  belongs_to :iteration
  validates_presence_of :name
  validates_presence_of :story_type
end
