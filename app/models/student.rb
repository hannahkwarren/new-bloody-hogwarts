class Student < ApplicationRecord
  validates :name, presence: :true 
  validates :age, presence: :true 
  validates :house, presence: :true
  has_many :student_courses 
  has_many :courses, through: :student_courses

  def self.average_student_age 
    average(:age)
  end

  def self.alpha_order 
    order(name: :asc)
  end
end
