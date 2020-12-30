class Repository
  attr_reader :name,
              :url,
              :language
  def initialize(repo_data)
    @name = repo_data[:name]
    @url = repo_data[:svn_url]
    @language = repo_data[:language]
  end
end
