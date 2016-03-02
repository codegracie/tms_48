class UserSubject < ActiveRecord::Base
  belongs_to :user_course
  belongs_to :user
  belongs_to :subject
  has_many :user_tasks

  accepts_nested_attributes_for :user_tasks, reject_if:
    lambda {|task| task[:user_subject_id].blank?}, allow_destroy: true
end