require 'bundler/setup'
require 'sinatra/base'
require 'sass'
require 'haml'
require './helpers'

class App < Sinatra::Base

  helpers Helpers

  enable :sessions, :static

  set :views, :scss => 'views/scss', :default => 'views'
  set :scss, :style => :compressed, :debug_info => false
  set :haml, :format => :html5, :escape_html => false

  configure :development do
    enable :dump_errors, :logging
  end

  configure :production do
    disable :dump_errors, :logging
    set :bind, '0.0.0.0'
    set :port, 80
  end

  Dir[File.dirname(__FILE__) + '/apps/*.rb'].each do |file| 
    file_class = 'app/' + File.basename(file, File.extname(file))
    require file
    use file_class.classify.constantize
  end

  get '/css/:file.css' do
    halt 404 unless File.exist?("views/scss/#{params[:file]}.scss")
    time = File.stat("views/scss/#{params[:file]}.scss").ctime
    last_modified(time)
    scss params[:file].intern
  end

  get '/tpl/*' do
    tpl = 'templates/' + params[:splat][0]
    haml tpl.to_sym, :layout => nil
  end

  get '/*' do
    @app = 'main'
    haml :app
  end

end
