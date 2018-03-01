require 'sinatra'
require 'fnv'
require 'yaml/store'
require 'date'

get '/' do
    store = YAML::Store.new 'posts.yaml'
    @posts = store.transaction { store['posts'] }
    if @posts == nil then
        @posts = []
    end

    erb :index
end

post '/post' do
    author = params['author']
    message = params['message']

    store = YAML::Store.new 'posts.yaml'
    store.transaction do
        post_hash = FNV.new.fnv1a_64(author + message)
        store['posts'] ||= {}
        store['posts'][post_hash] = {}
        store['posts'][post_hash][:author] = author
        store['posts'][post_hash][:message] = message
        store['posts'][post_hash][:time_posted] = DateTime.now.strftime('%s')
    end

    redirect '/'
end