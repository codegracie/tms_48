class UserTask < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  belongs_to :user
  belongs_to :task
  belongs_to :user_subject
end