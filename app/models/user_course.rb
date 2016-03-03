class UserCourse < ActiveRecord::Base
  has_many :user_subjects
  belongs_to :course
  belongs_to :user

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