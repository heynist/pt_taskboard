require 'spec_helper'

describe Membership do
  it { should validate_presence_of(:name) }
end