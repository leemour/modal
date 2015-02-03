class Question < ActiveRecord::Base
  belongs_to :lesson
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: :all_blank

  validates :text, presence: true, length: {in: 5..50}
end
