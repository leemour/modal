class AddLessonIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :lesson, index: true
  end
end
