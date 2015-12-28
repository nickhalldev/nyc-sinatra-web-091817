class FiguresController < ApplicationController
    get '/figures' do 
      @figure = Figure.all
      erb :'figures/index'
    end

    get '/figures/new' do 
      erb :'figures/new'
    end


    get '/figures/:id' do
      binding.pry
      @figure = Figure.find(params[:id])
      erb :'figures/show'
    end

    get '/figures/:id/edit' do 
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
    end

    post '/figures' do
      @figure = Figure.create(name: params["figure"]["name"])
      params[:figure][:titles].each do |title|
      binding.pry
        @figure.titles << title unless title.empty?
      end
      @figure.save

      redirect_to "/figures/#{@figure.id}"
    end

end