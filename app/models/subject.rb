class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :activities, as: :target
  has_many :tasks
end