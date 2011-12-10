class Project < ActiveRecord::Base
  has_many :stories
  validates_presence_of :name
end
