class DashboardController < ApplicationController
  def show
    @public_repos = RepositoryFacade.get_public_repos(current_user)
    @private_repos = RepositoryFacade.get_private_repos(current_user)
  end
end
