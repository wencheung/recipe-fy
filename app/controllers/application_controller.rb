require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/recipe_result' do
    @ingred = params[:ingredients]
    @quer = params[:query]
    
    @results_array = get_recipes(@ingred, @quer)
    pp @results_array
    erb :recipe_result
    
  end
  
end
