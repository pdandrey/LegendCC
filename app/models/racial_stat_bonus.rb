class RacialStatBonus < ActiveRecord::Base
  belongs_to :race
  belongs_to :stat
end
