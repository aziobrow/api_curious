class GithubUser
  attr_reader :username, :image_url, :starred_repos, :followers, :following, :organizations, :repos

  def initialize(attributes = {})
    @username = attributes[:login]
    @image_url  = attributes[:avatar_url]
    @starred_repos       = get_attribute("starred")
    @followers      = get_attribute("followers")
    @following   = get_attribute("following")
    @organizations  = get_attribute("orgs")
    @repos  = get_attribute("repos")
  end

  def get_attribute(attribute)
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["X-API-KEY"] = User.first.oauth_token
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/users/#{@username}/#{attribute}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
