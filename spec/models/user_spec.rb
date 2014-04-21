require 'spec_helper'

describe User do
  it { should have_many :contacts }
  it { should have_many :contacts }
  it { should have_many :receivers }
  it { should have_many :messages }
end
