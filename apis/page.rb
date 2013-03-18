require 'sinatra/base'
require 'json'

class App::Page < Sinatra::Base

  set(:xhr) { |xhr| condition { request.xhr? == xhr } }

  before do
    @pages ||= [
      { :id => 0, :title => 'About Us', :slug => 'about-us', :content => 'About Us Content', :date => Date.new(2020, 3, 1), },
      { :id => 1, :title => 'Contact Us', :slug => 'contact-us', :content => 'Contact Us Content', :date => Date.new(2020, 3, 2), },
    ]
  end

  get '/api/:version/page', :xhr => true, :provides => :json do
    @pages.each{ |page| return page.to_json if page[:slug] == params[:slug] }

    return {}.to_json
  end

end
