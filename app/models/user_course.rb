class UserCourse < ActiveRecord::Base
  include PublicActivity::Common

  has_many :user_subjects
  belongs_to :course
  belongs_to :trainee, class_name: User.name, foreign_key: :user_id

  def create_user_subjects
    subjects = self.course.subjects
    subjects.each do |subject|
      UserSubject.create(
        user_course_id: self.id,
        user_id: self.user_id,
        subject_id: subject.id,
        status: "Not Finish"
      )
    end
  end
end