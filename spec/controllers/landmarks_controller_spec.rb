require 'spec_helper'

describe LandmarksController do
  before do
    Landmark.create(name: 'BQE', year_completed: '1961')
  end

  after do
    Landmark.destroy_all
  end

  it "allows you to list all landmarks" do
    get '/landmarks'
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single landmark" do
    get "/landmark/1"
    expect(last_response.status).to eq(200)
  end
end
