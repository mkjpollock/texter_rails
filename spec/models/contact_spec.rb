require 'spec_helper'

describe Contact do
  it { should belong_to :user }
  it { should belong_to :receiver }
  it { should have_many :messages }
end
