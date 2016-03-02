class UserTasksController < ApplicationController
  def create
    @user_task = UserTask.new user_task_params
    if @user_task.save
      flash[:success] = t ".success"
      redirect_to current_user
    else
      flash[:failed] = t ".failed"
      redirect_to current_user
    end
  end

  private

  def user_task_params
    params.require(:user_task).permit :user_subject_id, :user_id, :task_id, :status
  end
end