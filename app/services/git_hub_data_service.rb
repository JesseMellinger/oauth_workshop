class GitHubDataService
  def self.get_public_repos(user)
    response = conn.get('/user/repos', {}, {'Authorization': "token #{user.token}"}) do |req|
      req.params['type'] = 'public'
      req.params['per_page'] = 100
    end
    parse_response(response)
  end

  def self.get_private_repos(user)
    response = conn.get('/user/repos', {}, {'Authorization': "token #{user.token}"}) do |req|
      req.params['type'] = 'private'
      req.params['per_page'] = 100
    end
    parse_response(response)
  end

  private
  def self.conn
    Faraday.new('https://api.github.com')
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
