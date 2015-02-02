require 'rails_helper'

RSpec.describe Lesson, :type => :model do
  it { should have_many(:images).class_name("LessonImage").dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(5).is_at_most(30) }
  it { should validate_presence_of(:description) }
  it { should ensure_length_of(:description).is_at_least(30).is_at_most(6000) }
  it { should accept_nested_attributes_for :images }
end
