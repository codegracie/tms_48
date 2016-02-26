class Admin::CoursesController < AdminController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :edit]

  def create
    if @course.save course_params
      flash[:success] = t ".success"
      redirect_to admin_user_courses_path current_user
    else
      render "new"
    end
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t ".success"
      redirect_to admin_user_courses_path current_user
    else
      render "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t ".success"
    redirect_to admin_user_courses_path current_user
  end

  private

  def course_params
    params.require(:course).permit :user_id, :title, :description, :start_date, :end_date,
      :status, course_subjects_attributes: [:id, :course_id, :subject_id, :_destroy],
      supervisor_courses_attributes: [:id, :user_id, :course_id, :_destroy],
      user_ids: []
  end

  def load_subjects
    Subject.all.each do |subject|
      @course.course_subjects.new subject: subject unless @course.subjects.include? subject
    end
  end
end
