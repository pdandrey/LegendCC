# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
stats = Stat.create [
    { name: 'Strength',     abbreviation: 'STR', is_primary?: true },
    { name: 'Constitution', abbreviation: 'CON', is_primary?: true },
    { name: 'Dexterity',    abbreviation: 'DEX', is_primary?: true },
    { name: 'Intelligence', abbreviation: 'INT', is_primary?: true },
    { name: 'Wisdom',       abbreviation: 'WIS', is_primary?: true },
    { name: 'Charisma',     abbreviation: 'CHA', is_primary?: true },

    { name: 'Fortitude Save', abbreviation: 'Fort' },
    { name: 'Reflex Save',    abbreviation: 'Ref' },
    { name: 'Will Save',      abbreviation: 'Will' },
    { name: 'Attack Roll',    abbreviation: 'Atk' },
    { name: 'Armor Class',    abbreviation: 'AC' },
    { name: 'Movement Speed', abbreviation: 'Speed' },
    { name: 'Initiative', abbreviation: 'Init' },
    { name: 'Damage Reduction', abbreviation: 'DR' }
  ]
stats = Hash[stats.map { |s| [ s.abbreviation.downcase.to_sym, s ] }]

skills = Skill.create [
    { name: 'Acrobatics', stat: stats[:dex], text:%q{
    Acrobatics is your character’s ability to jump, tumble, and roll around or over obstacles. This includes obstacles that want to stab you. You also use Acrobatics to determine your ability to balance on things that you normally couldn't balance on. For purposes of dealing with environmental hazards, one Acrobatics check should generally be enough unless something happens to increase the difficulty of that check; for purposes of combat, one check should generally be needed for each [Round] in which you attempt to use a function of the Acrobatics skill.
*<red>Moving Through Threatened Areas:</red> If you wish to avoid provoking attacks of opportunity from moving through a creature’s threatened area, you may make an Acrobatics check (DC equal to 10 + your opponent’s BAB + your opponent’s KOM) when you enter its threatened area. This DC is increased by 10 for areas within that opponent's occupied square(s). Success means you do not provoke an attack of opportunity; failure means you provoke an attack of opportunity but can still move normally (aside from any consequences of the attack).
*<red>Moving Through Occupied Squares:</red> As part of a move action, you may make an Acrobatics check (DC equal to 15 + your opponent’s BAB + your opponent’s KOM) to enter a square occupied by an opponent who can target you with melee attacks. This does not allow you to end movement in that square.
*<red>Surprising an Opponent:</red> As part of a move action, you can halve your movement speed and make an Acrobatics check with a DC equal to an opponent’s Armor Class. If you succeed, your opponent loses track of you and is [Flat-footed] against any attacks you make on your turn. If you attempted to avoid an attack of opportunity as part of the same move action, don’t make two Acrobatics checks – compare the same check to each DC and determine the results separately.
*<red>Balancing: If you would suffer a Trivial Fall, Hazardous Fall, or Dramatic Plunge, you may make a Balance check instead, with a DC chosen by the GM that corresponds to a surface or object that you can use to keep from falling. If you succeed, you gain the Fly movement mode for one [Round]. (You may immediately use a free action to lift off, gaining the [Flying] condition.) A few representative objects, with appropriate DCs, follow:
**DC 10: Slick floor in a grocery store. The kind that require signs so people don’t slip and hurt themselves. Alternatively, an oil slick on a road.
**DC 15: Icy rock.
**DC 20: Rain-slick precipice of darkness, or an inch-thick tree branch.
**DC 25: The point of a spear (obviously, without being impaled). This cannot get you un-stabbed if someone successfully attacks you.
**DC 30: The grains of sand in a desert storm.
**DC 35: Clouds.
*<red>Jumping:</red> Once per [Round], you may make an Acrobatics skill check to jump over an obstacle or jump high into the air.
**DC 10: Cross a fast stream without getting your boots wet.
**DC 15: Jump from one roof to another, with a narrow alley separating them.
**DC 20: Jump from one roof to another, across a street. Alternatively, vault an ogre-proof fence.
**DC 25: Leap onto the back of a charging warOnce per [Round], you may make an Acrobatics skill check to jump over an obstacle or jump high into the air.
**DC 10: Cross a fast stream without getting your boots wet.
**DC 15: Jump from one roof to another, with a narrow alley separating them.
**DC 20: Jump from one roof to another, across a street. Alternatively, vault an ogre-proof fence.
**DC 25: Leap onto the back of a charging war elephant. You gain the Fly movement mode for one [Round] (You may immediately use a free action to lift off, gaining the [Flying] condition.). At the beginning of your turn, if you are [Flying] and do not possess the Fly movement mode, you suffer a Trivial Fall, Hazardous Fall, or Dramatic Plunge, as determined by the GM. You may not make a new Acrobatics check to continue your flight without something to jump from.
**DC 30: Leap onto a flying skeletal dragon to confront the lich riding it. Ideally, have some way to get back down in an emergency. You gain the Fly movement mode for two [Rounds]. (You may immediately use a free action to lift off, gaining the [Flying] condition.) At the beginning of your turn, if you are [Flying] and do not possess the Fly movement mode, you suffer a Trivial Fall, Hazardous Fall, or Dramatic Plunge, as determined by the GM.
**DC 35: “Neo’s doing his Superman thing again.” You gain [Flying] for 3 [Rounds]. You may not make new Acrobatics checks to continue your flight without something to jump from, but if you fail you fall and take 5d6 damage.” with “You gain the Fly movement mode for three [Rounds]. (You may immediately use a free action to lift off, gaining the [Flying] condition.) At the beginning of your turn, if you are [Flying] and do not possess the Fly movement mode, you suffer a Trivial Fall, Hazardous Fall, or Dramatic Plunge, as determined by the GM.}.strip },
    { name: 'Athletics',    stat: stats[:str], text: %q{}.strip },
    { name: 'Larceny',      stat: stats[:dex], text: %q{}.strip },
    { name: 'Stealth',      stat: stats[:dex], text: %q{}.strip },
    { name: 'Ride',         stat: stats[:dex], text: %q{}.strip },
    { name: 'Vigor',        stat: stats[:con], text: %q{}.strip },
    { name: 'Engineering',  stat: stats[:int], text: %q{}.strip },
    { name: 'Geography',    stat: stats[:int], text: %q{}.strip },
    { name: 'History',      stat: stats[:int], text: %q{}.strip },
    { name: 'Medicine',     stat: stats[:int], text: %q{}.strip },
    { name: 'Nature',       stat: stats[:int], text: %q{}.strip },
    { name: 'Bluff',        stat: stats[:cha], text: %q{}.strip },
    { name: 'Diplomacy',    stat: stats[:cha], text: %q{}.strip },
    { name: 'Intimidate',   stat: stats[:cha], text: %q{}.strip },
    { name: 'Perception',   stat: stats[:wis], text: %q{}.strip }
  ]
skills = Hash[skills.map { |s| [ s.name.downcase.to_sym, s ] }]

feats = Feat.create[
    { name: 'Arcantric Accuracy' },
    { name: 'Baptized in Rage' },
    { name: 'Battleforged' },
    { name: 'Bravado' },
    { name: 'Breakneck Pace' },
    { name: 'By Will Sustained' },
    { name: 'Chatty Bugger' },
    { name: 'Cheerful Hemoglobin' },
    { name: 'Damage Specialization' },
    { name: 'Drink Deep' },
    { name: 'Elemental Specialization' },
    { name: 'Esoteric Adept' },
    { name: 'Exit, Stage Left' },
    { name: 'Feign Death' },
    { name: 'Floating Feat' },
    { name: 'Glyphweave Adept' },
    { name: 'Guild Initiation' },
    { name: 'Into The Breach' },
    { name: 'Livers Need Not Apply' },
    { name: 'Manyspell Magus' },
    { name: 'Multiclass Flexibility' },

]