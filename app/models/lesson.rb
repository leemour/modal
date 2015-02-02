class Lesson < ActiveRecord::Base
  validates :name, presence: true, length: {in: 5..30}
  validates :description, presence: true, length: {in: 30..6000}
end
