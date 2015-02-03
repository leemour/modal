class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.boolean :final

      t.timestamps
    end
  end
end
