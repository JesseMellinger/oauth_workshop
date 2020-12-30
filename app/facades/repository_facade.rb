class RepositoryFacade
  def self.get_public_repos(user)
    repositories = GitHubDataService.get_public_repos(user)
    create_repo_objects(repositories)
  end

  def self.get_private_repos(user)
    repositories = GitHubDataService.get_private_repos(user)
    create_repo_objects(repositories)
  end

  private
  def self.create_repo_objects(repositories)
    repositories.map do |repo|
      Repository.new(repo)
    end
  end
end
