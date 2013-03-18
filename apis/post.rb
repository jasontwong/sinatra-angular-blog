require 'sinatra/base'
require 'json'

class App::Post < Sinatra::Base

  set(:xhr) { |xhr| condition { request.xhr? == xhr } }

  before do
    @posts ||= [
      { :id => 0, :title => 'Title 0', :slug => 'title-0', :excerpt => 'Excerpt 0', :content => 'Detail 0', :date => Date.new(2020, 3, 1), },
      { :id => 1, :title => 'Title 1', :slug => 'title-1', :excerpt => 'Excerpt 1', :content => 'Detail 1', :date => Date.new(2020, 3, 2), },
      { :id => 2, :title => 'Title 2', :slug => 'title-2', :excerpt => 'Excerpt 2', :content => 'Detail 2', :date => Date.new(2020, 3, 3), },
      { :id => 3, :title => 'Title 3', :slug => 'title-3', :excerpt => 'Excerpt 3', :content => 'Detail 3', :date => Date.new(2020, 3, 4), },
      { :id => 4, :title => 'Title 4', :slug => 'title-4', :excerpt => 'Excerpt 4', :content => 'Detail 4', :date => Date.new(2020, 3, 5), },
      { :id => 5, :title => 'Title 5', :slug => 'title-5', :excerpt => 'Excerpt 5', :content => 'Detail 5', :date => Date.new(2020, 3, 6), },
      { :id => 6, :title => 'Title 6', :slug => 'title-6', :excerpt => 'Excerpt 6', :content => 'Detail 6', :date => Date.new(2020, 3, 7), },
      { :id => 7, :title => 'Title 7', :slug => 'title-7', :excerpt => 'Excerpt 7', :content => 'Detail 7', :date => Date.new(2020, 3, 8), },
      { :id => 8, :title => 'Title 8', :slug => 'title-8', :excerpt => 'Excerpt 8', :content => 'Detail 8', :date => Date.new(2020, 3, 9), },
      { :id => 9, :title => 'Title 9', :slug => 'title-9', :excerpt => 'Excerpt 9', :content => 'Detail 9', :date => Date.new(2020, 3, 10), },
      { :id => 10, :title => 'Title 10', :slug => 'title-10', :excerpt => 'Excerpt 10', :content => 'Detail 10', :date => Date.new(2020, 3, 11), },
      { :id => 11, :title => 'Title 11', :slug => 'title-11', :excerpt => 'Excerpt 11', :content => 'Detail 11', :date => Date.new(2020, 3, 12), },
      { :id => 12, :title => 'Title 12', :slug => 'title-12', :excerpt => 'Excerpt 12', :content => 'Detail 12', :date => Date.new(2020, 3, 13), },
      { :id => 13, :title => 'Title 13', :slug => 'title-13', :excerpt => 'Excerpt 13', :content => 'Detail 13', :date => Date.new(2020, 3, 14), },
      { :id => 14, :title => 'Title 14', :slug => 'title-14', :excerpt => 'Excerpt 14', :content => 'Detail 14', :date => Date.new(2020, 3, 15), },
      { :id => 15, :title => 'Title 15', :slug => 'title-15', :excerpt => 'Excerpt 15', :content => 'Detail 15', :date => Date.new(2020, 3, 16), },
      { :id => 16, :title => 'Title 16', :slug => 'title-16', :excerpt => 'Excerpt 16', :content => 'Detail 16', :date => Date.new(2020, 3, 17), },
    ]

    @sorted_posts ||= @posts.sort{ |x,y| y[:date] <=> x[:date] }
  end

  get '/api/:version/posts', :xhr => true, :provides => :json do
    filtered_posts = @sorted_posts

    if params[:limit]
      filtered_posts = filtered_posts.take(params[:limit].to_i)
    end

    return filtered_posts.to_json
  end

  get '/api/:version/posts/:slug', :xhr => true, :provides => :json do
    @posts.each{ |post| return post.to_json if post[:slug] == params[:slug] }

    return {}.to_json
  end

end
