class Feat < ActiveRecord::Base
  has_and_belongs_to_many :races
end
