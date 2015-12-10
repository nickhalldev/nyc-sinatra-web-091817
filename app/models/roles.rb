class Roles <ActiveRecord::Base
  has_many :titles
  has_many :figures
end
