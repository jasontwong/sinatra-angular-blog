require 'sinatra/base'
require 'haml'
require 'json'

class App::Nav < Sinatra::Base

  set(:xhr) { |xhr| condition { request.xhr? == xhr } }

  before do
    @h_links = [
      { uri: '/posts', name: 'Posts', type: 'posts' },
      { uri: '/comments', name: 'Comments', type: 'comments' },
    ]
    @f_links = [
      { uri: '/about-us', name: 'About Us', type: 'about' },
      { uri: '/contact-us', name: 'Contact Us', type: 'posts' },
    ]
  end

  get '/:version/nav', :xhr => true, :provides => :json do
    case params[:type]
    when 'footer'
      @f_links.to_json
    else
      @h_links.to_json
    end
  end

end
