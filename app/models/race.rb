class Race < ActiveRecord::Base
  has_and_belongs_to_many :feats
  has_many :stat_bonuses, class_name: RacialStatBonus
  has_many :skill_bonuses, class_name: RacialSkillBonus
  has_many :racial_bonuses, class_name: RacialBonus
end