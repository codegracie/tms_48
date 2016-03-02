class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :get_user_courses

  private

  def get_user_courses
    @user_courses = @user.user_courses
  end
end