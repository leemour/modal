class AddLessonToLessonImages < ActiveRecord::Migration
  def change
    add_reference :lesson_images, :lesson, index: true
  end
end
