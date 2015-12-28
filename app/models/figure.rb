class Figure < ActiveRecord::Base
  has_many :roles
  has_many :titles, through: :roles
  has_many :landmarks
end
