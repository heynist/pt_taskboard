require 'spec_helper'

describe Story do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:story_type) }
end