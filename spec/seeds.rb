landmarks_list = {
    "Madison Square Guarden" => {
      :year_completed => 1901
    },
    "The big bull outside" => {
      :year_completed => 1995
    },
    "Flatiron School" => {
      :year_completed => 2014
    },
    "Museum Mile" => {
      :year_completed => 1058
    },
    "Subway Station" => {
      :year_completed => 2015
    },
    "Cast Iron" => {
      :year_completed => 1951
    },
    "Shea Stadium" => {
      :year_completed => 1964
    },
    "Flatiron Building" => {
      :year_completed => 1902
    },
    "Brooklyn Bridge" => {
      :year_completed => 1883
    }
  }

landmarks_list.each do |name, landmark_hash|
  p = Landmark.new
  p.name = name
  landmark_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

figure_list = {
    "Billy The Kid" => {
      :year_completed => 1881
    },
    "Mark Zuckerberg" => {
      :year_completed => 1984
    },
    "Ada Lovelace" => {
      :year_completed => 1852
    },
    "Linus Torvalds" => {
      :year_completed => 1969
    }
  }

figure_list.each do |name, figure_hash|
  p = Figure.new
  p.name = name
  p.save
end


title_list = {
    "The Mayor" => {
      :year_completed => 1901
    },
    "The Don" => {
      :year_completed => 1995
    },
    "Mr. President" => {
      :year_completed => 2012
    }
  }

title_list.each do |name, figure_hash|
  p = Title.new
  p.name = name
  p.save
end