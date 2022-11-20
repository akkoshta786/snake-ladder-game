class ApplicationController < ActionController::API
  def default_url_options
    if Rails.env.production?
      { host: 'https://snake-ladder-game-01.herokuapp.com' }
    else
      {}
    end
  end
end
