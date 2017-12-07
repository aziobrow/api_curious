class Organization

  attr_reader :login, :image_url, :url
  
  def initialize(raw_org_info)
    @login = raw_org_info[:login]
    @image_url = raw_org_info[:avatar_url]
    @url = raw_org_info[:url]
  end
end
