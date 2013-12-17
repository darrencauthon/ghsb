class Star

  def self.count_for options = {}
    client = Octokit::Client.new oauth_token: options[:token]
    client.repo("#{ options[:user] }/#{ options[:repo] }")['stargazers_count']
  end

end
