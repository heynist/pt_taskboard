class ProjectsController < InheritedResources::Base
  include ProjectsHelper

  def create_story
      create_pt_story
  end
end
