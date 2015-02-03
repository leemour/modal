class Answer < ActiveRecord::Base
  belongs_to :question

  validates :text, presence: true, length: {in: 1..50}
end
