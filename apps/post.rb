require 'sinatra/base'
require 'haml'
require 'json'

class App::Post < Sinatra::Base

  set :views, File.dirname(File.dirname(__FILE__)) + '/views'
  set(:xhr) { |xhr| condition { request.xhr? == xhr } }

  get '/posts*', :xhr => false do
    @app = 'posts'
    @ng = {
      :controllers => [ 'PostsCtrl', 'PostsDetailCtrl', 'PostsFormCtrl' ],
      :directives => [],
      :filters => [],
      :services => [],
    }
    haml :app
  end

end
