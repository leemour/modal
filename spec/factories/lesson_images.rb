FactoryGirl.define do
  factory :lesson_image do
    file_file_name { 'test.jpeg' }
    file_content_type { 'image/jpeg' }
    file_file_size { 1024 }
  end
end
