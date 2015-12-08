class FigureController < ApplicationController
    get '/figures' do 
      @figure = Figure.all
      erb :'figures/index'
    end

    get '/figures/:id' do 
      @figure = Figure.find(params[:id])
      erb :'figures/show'
    end

end