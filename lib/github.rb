class Github
  attr_accessor :client

  def initialize
    @client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def self.instance
    @instance
  end

  def get_stars_contributors(repo)
    repo_instance = @client.repo repo
    rel = repo_instance.rels[:contributors]
    # rel.get.data.each_with_object(Hash.new(0)) {|c, result| result[c.login] = c.contributions }
    rel.get.data.first(3).map(&:login)
  end

  @instance = new
  private_class_method :new
end