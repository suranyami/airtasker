class HomeController < ApplicationController

  before_action :limit_index

  def index
    render plain: 'OK'
  end

  private
  def limit_index
    limiter = session["limiter"]
    limiter.limit("home", 5000, 10)
    allowed = session["limiter"].can_i?("home")
    render status: 429, layout: false, file: 'public/429.html' unless allowed
  end

end
