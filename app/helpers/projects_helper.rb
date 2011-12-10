module ProjectsHelper

  require 'rubygems'
  require 'active_resource'

  project_id = '431109'

  class Story < ActiveResource::Base
    self.site = "http://www.pivotaltracker.com/services/v3/projects/431109"
    headers['X-TrackerToken'] = 'a748e5d490c78c6ca25c5b960cb052c8'
  end
  def create_pt_story
    # Create a story
    Story.create(:name => "Warp Speed ", :description => "do it now", :project_id => '431109')
  end

  def find_pt_story
    # Find stories
    #Story.find($STORY_ID, :params => {:project_id => @PROJECT_ID})
    #Story.find(:all, :params => {:project_id => @PROJECT_ID})
    #Story.find(:all, :params => {:filter => "label:'needs feedback' type:bug", :project_id => :project_id})
  end

  def update_pt_story
    # Update a story
    #story = Story.find($STORY_ID, :params => {:project_id => $PROJECT_ID})
    #story.name = "More speed Scotty"
    #story.save
  end


end
