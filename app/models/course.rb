class Course < ApplicationRecord
  validates :name, presence: :true 
  has_many :student_courses
  has_many :students, through: :student_courses

  def self.alpha_order 
    order(name: :asc)
  end
end
