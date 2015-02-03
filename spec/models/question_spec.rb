require 'rails_helper'

RSpec.describe Question, :type => :model do
  it { should validate_presence_of(:text) }
  it { should ensure_length_of(:text).is_at_least(5).is_at_most(50) }
  it { should have_many(:answers).dependent(:destroy) }
  it { should accept_nested_attributes_for :answers }
end
