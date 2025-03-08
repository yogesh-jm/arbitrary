class Api::V1::PostsController < ApplicationController
    before_action :doorkeeper_authorize!
  
    def index
      render json: { message: "This is a protected API", user: current_user }
    end
  
    private
  
    def current_user
      @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
  