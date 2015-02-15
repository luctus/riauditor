class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    if current_user
      Rails.logger.info "current_user: #{current_user.inspect}"
      redirect_to accounts_url
    end
  end
end
