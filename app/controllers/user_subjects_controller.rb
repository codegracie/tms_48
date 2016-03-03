class UserSubjectsController < ApplicationController
  load_and_authorize_resource

  before_action :build_user_task, except: [:update]

  def update
    if @user_subject.update_attributes user_subject_params
      flash[:success] = t ".success"
      redirect_to current_user
    else
      flash[:failed] = t ".failed"
      redirect_to current_user
    end
  end

  private

  def user_subject_params
    params.require(:user_subject).permit user_tasks_attributes:
      [:id, :user_subject_id, :user_id, :task_id, :status, :_destroy]
  end

  def build_user_task
    @user_subject.subject.tasks.each do |task|
      @user_subject.user_tasks.new task: task unless
        @user_subject.user_tasks.map{|user_task| user_task.task_id}.include? task.id
    end
  end
end