require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it { should belong_to(:question) }
  it { should validate_presence_of(:text) }
  it { should ensure_length_of(:text).is_at_least(1).is_at_most(50) }
end
