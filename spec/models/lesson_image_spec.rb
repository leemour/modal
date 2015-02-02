require 'rails_helper'

RSpec.describe LessonImage, :type => :model do
  it { should belong_to :lesson }
  it { should have_attached_file(:file) }
  it { should validate_attachment_content_type(:file).
                allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
                rejecting('text/plain', 'text/xml', 'application/pdf') }
  it { should validate_attachment_size(:file).
                less_than(2.megabytes) }
end
