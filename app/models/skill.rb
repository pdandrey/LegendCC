class Skill < ActiveRecord::Base
  belongs_to :stat
  has_many :racial_skill_bonuses, class_name: RacialSkillBonus
end
