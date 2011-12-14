# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require_relative "support/seeds_helper"
#require 'spreadsheet'

# ----------------------------------------
# clean up data
# ----------------------------------------


puts "cleaning data..."
Project.delete_all
Membership.delete_all
Iteration.delete_all
puts "done."

# ----------------------------------------
# build project, iterations, and memberships
# ----------------------------------------

puts "creating data..."

project=Project.create(name: "pt_taskboard")
Membership.create(project: project, name: "Steven Heyninck", email:"steven.heyninck@gmail.com", initials: "SH")
it1 = Iteration.create(project: project, nr: 1, start: Date.new(2011, 11, 4), finish: Date.new(2011, 11, 18))
story1 = Story.create(iteration: it1, story_type: 'feature', name: 'first story')
puts "done."
