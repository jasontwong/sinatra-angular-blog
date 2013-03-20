require 'sinatra/base'
require 'json'
require 'stringex'
require 'mongo'
require 'uri'

class App::Post < Sinatra::Base

  set(:xhr) { |xhr| condition { request.xhr? == xhr } }

  before do
    if ENV['MONGOHQ_URL']
      db = URI.parse(ENV['MONGOHQ_URL'])
      db_name = db.path.gsub(/^\//, '')
      @mongo = Mongo::MongoClient.new(db.host, db.port)
      @db = @mongo[db_name]
      @db.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
    else
      @mongo = Mongo::MongoClient.new('localhost')
      @db = @mongo['sin_ng_blog']
    end
    @posts = @db['blog.posts']
    @posts.create_index(:slug, :unique => true);
    @posts.create_index({ :date => :desc });
  end

  get '/api/:version/posts', :xhr => true, :provides => :json do
    cursor = @posts.find.sort(:date => :desc)
    params[:limit] ||= 10
    cursor = cursor.limit(params[:limit].to_i)
    posts = cursor.to_a

    return posts.collect{ |post| post['date'] = Time.at(post['date']).to_datetime; post }.to_json
  end

  get '/api/:version/posts/:slug', :xhr => true, :provides => :json do
    return @posts.find_one({ :slug => params[:slug] }).to_json
  end

  post '/api/:version/posts', :xhr => true, :provides => :json do
    post = JSON.parse(request.body.read.to_s).inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

    unless post[:slug]
      post[:slug] = post[:title].to_url
    end

    unless post[:date]
      post[:date] = Time.now.to_i
    end

    response = {
      :success => true,
      :errors => [],
    }

    begin
      @posts.insert(post)
    rescue
      response[:success] = false
    end

    return response.to_json
  end

  put '/api/:version/posts/:slug', :xhr => true, :provides => :json do
    begin
      post_data = JSON.parse(request.body.read.to_s)
      post_data.delete('_id')
      @posts.update({ :slug => params[:slug] }, { '$set' => post_data })
      post = post_data
    rescue
      post = @posts.find_one({ :slug => params[:slug] })
    end

    return post.to_json
  end

  delete '/api/:version/posts/:slug', :xhr => true, :provides => :json do
    params[:id] = params[:id].to_i

    return { :success => !@posts.reject!{ |post| post[:id] == params[:id] }.nil? }.to_json
  end

end
