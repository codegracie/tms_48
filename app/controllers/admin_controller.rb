class AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, :ensure_user_rights

  private
  def ensure_user_rights
    unless user_signed_in? && (current_user.admin? || current_user.supervisor?)
      redirect_to "/"
    end
  end
end