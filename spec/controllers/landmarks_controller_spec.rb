require 'spec_helper'

describe LandmarksController do
  before do
    Landmark.create(name: 'BQE', year_completed: '1961')
  end

  after do
    Landmark.destroy_all
  end

  it "allows you to create a new landmark" do
    pending "write your own spec!"
  end

  it "allows you to list all landmarks" do
    get '/landmarks'
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single landmark" do
    @landmark = Landmark.first.id
    get "/landmark/#{@landmark}"
    expect(last_response.status).to eq(200)
  end

  it "allows you to edit a single landmark" do
    pending "write your own spec!"
  end
end
