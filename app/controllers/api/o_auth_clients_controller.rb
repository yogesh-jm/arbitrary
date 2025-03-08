class Api::OAuthClientsController < ApplicationController
    # Endpoint to generate OAuth client credentials
    def create
      app = Doorkeeper::Application.create!(
        name: "Render API",
        redirect_uri: "urn:ietf:wg:oauth:2.0:oob",
        scopes: ""
      )
  
      render json: {
        client_id: app.uid,
        client_secret: app.secret
      }
    end
  end
  