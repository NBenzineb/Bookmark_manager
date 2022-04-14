require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark.rb'
require 'pg'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
enable :method_override

  get '/' do
    'This is your bookmark manager'
  end

  get '/bookmarks' do
   @bookmarks = Bookmark.all
   erb :'bookmarks/index'
  end

  post '/bookmarks_new' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end
  

  run! if app_file == $0
end
