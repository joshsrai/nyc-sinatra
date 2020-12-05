class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do
    @landmarks = Landmark.all #this will load up all of the landmarks from the database
    erb :"landmarks/index"
  end

  get "/landmarks/new" do
    erb :"landmarks/new" 
  end

  post "/landmarks" do
    @landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end 

  get '/landmarks/:id/edit' do  #load edit form
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end
  
  patch '/landmarks/:id' do #edit action
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    
    redirect to "/landmarks/#{@landmark.id}"
end 



end
