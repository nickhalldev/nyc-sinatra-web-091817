class FiguresController < ApplicationController
    
    get '/figures' do
      # binding.pry
      @figures = Figure.all
      erb :'figures/index'
    end

    get '/figures/new' do 
      erb :'figures/new'
    end


    get '/figures/:id' do
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
        @figure.titles << Title.find_or_create_by(name: title) unless title.empty? || @figure.titles.include?(Title.find_or_create_by(name: title))
      end
      @figure.save

      redirect to "/figures/#{@figure.id}"
    end

    post '/figures/:id' do 
      @figure = Figure.find(params[:id])
      @figure.update(name: params["figure"]["name"])
      params[:figure][:landmarks].each do |landmark|
        @figure.landmarks << Landmark.find_or_create_by(name: landmark) unless landmark.empty? || @figure.landmarks.include?(Landmark.find_or_create_by(name: landmark))
      end

      params[:figure][:titles].each do |title|
        @figure.titles << Title.find_or_create_by(name: title) unless title.empty? || @figure.titles.include?(Title.find_or_create_by(name: title))
      end
      @figure.save

      redirect to "/figures/#{@figure.id}"
    end

end