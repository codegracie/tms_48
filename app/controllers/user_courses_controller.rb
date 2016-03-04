class UserCoursesController < ApplicationController
  def create
    @user_course = UserCourse.new user_course_params

    if @user_course.save
      @user_course.create_activity :create, owner: current_user
      @user_course.create_user_subjects
      flash[:success] = t ".success"
      redirect_to current_user
    else
      flash[:danger] = t ".failed"
      redirect_to course_path params[:course_id]
    end
  end

  private

  def user_course_params
    params.require(:user_course).permit :user_id, :course_id
  end
end