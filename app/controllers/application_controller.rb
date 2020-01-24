class ApplicationController < ActionController::Base
    #cross site request forgery
    protect_from_forgery with: :exception
end
