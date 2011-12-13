class Membership < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name
  validates_presence_of :email
end
