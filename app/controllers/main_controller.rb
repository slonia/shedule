class MainController < ApplicationController
	skip_before_filter :authorize, only: [:index, :about]
  def index
  	@universities = University.order(:name)
  end

  def admin
  end

  def about
  end
end
