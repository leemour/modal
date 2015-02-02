class AddAttachmentFileToLessonImages < ActiveRecord::Migration
  def self.up
    change_table :lesson_images do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :lesson_images, :file
  end
end
