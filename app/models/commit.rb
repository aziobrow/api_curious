class Commit
  
  attr_reader :date

  def initialize(raw_commit_info)
    @date = raw_commit_info[:commit][:author][:date]
  end
end
