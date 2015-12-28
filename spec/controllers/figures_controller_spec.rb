require 'spec_helper'

describe FiguresController do
  before do
    queenb = Figure.create(:name => "Beyonce")
    kanye = Figure.create(:name => "Kanye")
    bqe = Landmark.create(name: 'BQE', year_completed: 1961)
    mr_president = Title.create(name: "Mr. President")
    bqe.figure = queenb
    bqe.save
  end

  after do
    Figure.destroy_all
  end

  it "allows you to view form to create a new figure" do
    visit '/figures/new'
    expect(page.body).to include('<form')
    expect(page.body).to include('figure[name]')
    expect(page.body).to include('figure[titles][]')
  end

  it "allows you to create a new figure" do
    visit '/figures/new'
    fill_in :figure_name, :with => "Doctor Who"
    check "title_#{Title.first.id}"
    click_button "Create New Figure"
    expect(Figure.all.count).to eq(3)
  end

  it "allows you to list all figures" do
    visit '/figures'
    
    expect(page.status_code).to eq(200)

    expect(page.body).to include("Beyonce")
    expect(page.body).to include('Kanye')
  end

  it "allows you to see a single Figure" do
    @figure = Figure.first
    get "/figures/#{@figure.id}"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("#{@figure.name}")
  end

  it "allows you to view form edit a single figure" do
    @figure = Figure.first
    get "/figures/#{@figure.id}/edit"

    expect(last_response.status).to eq(200)
    expect(last_response.body).to include('<form')
    expect(last_response.body).to include('figure[name]')
    expect(last_response.body).to include('figure[titles]')
    expect(last_response.body).to include(@figure.name)    
  end


  it "allows you to edit a single figure" do
    @figure = Figure.first
    visit "/figures/#{@figure.id}/edit"
    fill_in :figure_name, with: "Missy"
    fill_in :new_landmark, with: "Big Tower"
    click_button "Edit Figure"
    @figure = Figure.first
    expect(page.current_path).to eq("/figures/#{@figure.id}")
    expect(page.body).to include(@figure.name)    

    expect(page.body).to include("Big Tower")
    expect(@figure.name).to eq("Missy")

  end
end
