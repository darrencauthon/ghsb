require 'bundler/setup'
ENV['RACK_ENV'] ||= 'development'
Bundler.require :default, ENV['RACK_ENV']

Dotenv.load if defined? Dotenv

require './lib/markdown'

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

  set :haml, layout: false

  get '/' do
    haml :index, :layout => :layout
  end

  get '/stylesheets/:name.css' do
    content_type 'text/css', charset: 'utf-8'
    sass "stylesheets/#{ params[:name] }".to_sym
  end

  get '/:owner/:repo/issues' do
    client = github_client params[:token]
    @issues = client.issues "#{ params[:owner] }/#{ params[:repo] }"
    haml :issues
  end

  get '/:token/:owner/:repo/issues' do
    client = github_client params[:token]
    @issues = client.issues "#{ params[:owner] }/#{ params[:repo] }"
    haml :issues
  end

  helpers do

    def github_client token
      Octokit::Client.new oauth_token: token
    end

    def gravatar_for id
      default = 'https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png'
      "https://secure.gravatar.com/avatar/#{ id }?s=30&d=#{ default }"
    end
  end

end

