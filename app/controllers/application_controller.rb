class ApplicationController < ActionController::Base
  # Skipping for testing purposes.
  # In real application a proxy server like Nginx should be configured.
  skip_before_action :verify_authenticity_token
end
