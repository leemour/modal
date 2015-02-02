class CreateLessonImages < ActiveRecord::Migration
  def change
    create_table :lesson_images do |t|

      t.timestamps
    end
  end
end
