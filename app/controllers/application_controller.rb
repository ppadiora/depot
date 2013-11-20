class ApplicationController < ActionController::Base
  protect_from_forgery

 def date_loaded
    return Time.now
  end
  
end
