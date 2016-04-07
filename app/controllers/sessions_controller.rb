require_relative "../services/oauthservice"
class SessionsController < ApplicationController
  def create
    scope = params[:scope]
    response = OauthService.new.get_token(params[:code], params[:state])
  end
end
