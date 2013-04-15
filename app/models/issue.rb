class Issue

  def self.for options = {}
    client = Octokit::Client.new oauth_token: options[:token]
    repo = options[:user].present? ? "#{ options[:user] }/#{ options[:repo] }" : nil
    client.issues repo
  end

end
