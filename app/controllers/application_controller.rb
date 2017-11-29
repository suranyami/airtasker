require 'limiter'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :limiter

  private
  def limiter
    session["limiter"] = if session["limiter"]
      Limiter.new(session["limiter"]["buckets"])
    else
      Limiter.new
    end
  end

end
