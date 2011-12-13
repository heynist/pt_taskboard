require 'spec_helper'

describe Iteration do
  it { should validate_presence_of(:nr) }
  it { should validate_presence_of(:start) }
  it { should validate_presence_of(:finish) }
end