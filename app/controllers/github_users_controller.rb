class GithubUsersController < ApplicationController
  def show
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["X-API-KEY"] = current_user.oauth_token
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/users/#{current_user.username}")

    attributes = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    @user = GithubUser.new(attributes)
  end
end
