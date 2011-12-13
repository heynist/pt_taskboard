class Iteration < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :nr
  validates_presence_of :start
  validates_presence_of :finish
end
