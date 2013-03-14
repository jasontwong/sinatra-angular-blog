require 'sinatra/base'
require 'haml'
require 'json'

class App::Post < Sinatra::Base

  set(:xhr) { |xhr| condition { request.xhr? == xhr } }

end
