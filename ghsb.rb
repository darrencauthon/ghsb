require 'bundler/setup'
ENV['RACK_ENV'] ||= 'development'
Bundler.require :default, ENV['RACK_ENV']

Dotenv.load if defined? Dotenv

if ENV['RACK_ENV'] == 'production'
  use Rack::SslEnforcer
  set :session_secret, 'asdfa2342923422f1adc05c837fa234230e3594b93824b00e930ab0fb94b'

  #Enable sinatra sessions
  use Rack::Session::Cookie, key:          '_rack_session',
                             path:         '/',
                             expire_after: 2592000, # In seconds
                             secret:       settings.session_secret
end

class GhSB < Sinatra::Base

  get '/:token/:owner/:repo/issues' do
    client  = Octokit::Client.new oauth_token: params[:token]
    @issues = client.issues "#{ params[:owner] }/#{ params[:repo] }"
    haml :issues
  end

  helpers do
    def gravatar_for id
      default = 'https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png'
      "https://secure.gravatar.com/avatar/#{ id }?s=30&d=#{ default }"
    end
  end

end
