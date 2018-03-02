require 'sinatra'
require 'sinatra/activerecord'
require 'kramdown'
require 'fnv'
require 'yaml/store'
require 'date'

require './models.rb'

get '/' do
    @posts = Posts.all
    erb :index
end

post '/post' do
    author = params['author']
    message = Rack::Utils.escape_html(params['message'])
    message = Kramdown::Document.new(message).to_html
    post_hash = FNV.new.fnv1a_64(author + message)

    post = Posts.new
    post.id = post_hash
    post.author = author
    post.message = message
    post.time_posted = DateTime.now.strftime('%s')
    post.save

    redirect '/'
end

helpers do
    def h(text)
        Rack::Utils.escape_html(text)
    end
end