class Milestone

  def self.for options = {}
    milestones = all_milestones_for options
    milestones.select { |x| x.closed_issues + x.open_issues > 0 }
  end

  private

  def self.all_milestones_for options
    client = Octokit::Client.new oauth_token: options[:token]
    repo = options[:user].present? ? "#{ options[:user] }/#{ options[:repo] }" : nil
    client.milestones repo
  end

end
