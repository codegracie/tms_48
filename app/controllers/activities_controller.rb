class ActivitiesController < ApplicationController
  def index
    details_ids = User.photos.map { |photo| photo.details.id }

    activities_by_owner = PublicActivity::Activity.where(owner: current_user)
    activities_by_reads = PublicActivity::Activity.where("trackable_type = 'Details' AND trackable_id in ?", details_ids)

    @activities = activities_by_owner.or(activities_by_reads).distinct
  end
end