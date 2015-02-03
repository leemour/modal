class Lesson < ActiveRecord::Base
  has_many :images, class_name: LessonImage, dependent: :destroy
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true,
    reject_if: :all_blank

  validates :name, presence: true, length: {in: 5..30}
  validates :description, presence: true, length: {in: 30..6000}
end
