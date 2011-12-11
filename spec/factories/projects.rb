FactoryGirl.define do
  #factory :project do
  #  name 'project'
  #end
  factory :project_taskboard, :class => Project do
    name "taskboard project"
  end
  factory :project_planning_poker, :class => Project do
    name "planning poker project"
  end
end