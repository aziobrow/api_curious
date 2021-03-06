class Repository

  attr_reader :name, :updated_at

  def initialize(raw_repo_info)
    if raw_repo_info.class == Hash
      @name = raw_repo_info[:name]
      @full_name = raw_repo_info[:full_name]
      @url = raw_repo_info[:html_url]
      @description = raw_repo_info[:description]
      @language = raw_repo_info[:language]
      @updated_at = raw_repo_info[:updated_at]
      @starred_count = raw_repo_info[:stargazers_count]
      @forked = raw_repo_info[:fork]
    end
  end
end
