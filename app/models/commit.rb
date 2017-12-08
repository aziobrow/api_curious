class Commit

  attr_reader :date, :message

  def initialize(raw_commit_info)
    @message = raw_commit_info[:commit][:message]
    @date = raw_commit_info[:commit][:author][:date]
  end
end
