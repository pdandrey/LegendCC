class Stat < ActiveRecord::Base
  has_many :skills
  has_many :racial_stat_bonuses, class_name: RacialStatBonus
end
