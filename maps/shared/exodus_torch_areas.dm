// Command

/area/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads
	icon_state = "head_quarters"

// CentCom

/area/centcom/control
	name = "Centcom Control"

/area/centcom/creed
	name = "Creed's Office"

/area/centcom/evac
	name = "Centcom Emergency Shuttle"

/area/centcom/ferry
	name = "Centcom Transport Shuttle"

/area/centcom/living
	name = "Centcom Living Quarters"

/area/centcom/suppy
	name = "Centcom Supply Shuttle"

/area/centcom/test
	name = "Centcom Testing Facility"

// Solars
/area/maintenance/auxsolarport
	name = "Solar Maintenance - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

/area/maintenance/auxsolarstarboard
	name = "Solar Maintenance - Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

/area/solar/auxstarboard
	name = "Fore Starboard Solar Array"
	icon_state = "panelsA"

/area/solar/port
	name = "Port Auxiliary Solar Array"
	icon_state = "panelsP"

// Maintenance

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/incinerator
	name = "Incinerator"
	icon_state = "disposal"

// Storage

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"

// Holodecks

/area/holodeck
	name = "Holodeck"
	icon_state = "Holodeck"
	lighting_use_dynamic = 0
	sound_env = LARGE_ENCLOSED

/area/holodeck/alphadeck
	name = "Holodeck Alpha"

/area/holodeck/source_plating
	name = "Holodeck - Off"

/area/holodeck/source_emptycourt
	name = "Holodeck - Empty Court"
	sound_env = ARENA

/area/holodeck/source_boxingcourt
	name = "Holodeck - Boxing Court"
	sound_env = ARENA

/area/holodeck/source_basketball
	name = "Holodeck - Basketball Court"
	sound_env = ARENA

/area/holodeck/source_thunderdomecourt
	name = "Holodeck - Thunderdome Court"
	sound_env = ARENA

/area/holodeck/source_courtroom
	name = "Holodeck - Courtroom"
	sound_env = AUDITORIUM

/area/holodeck/source_beach
	name = "Holodeck - Beach"
	sound_env = PLAIN

/area/holodeck/source_wildlife
	name = "Holodeck - Wildlife Simulation"

/area/holodeck/source_meetinghall
	name = "Holodeck - Meeting Hall"
	sound_env = AUDITORIUM

/area/holodeck/source_theatre
	name = "Holodeck - Theatre"
	sound_env = CONCERT_HALL

/area/holodeck/source_picnicarea
	name = "Holodeck - Picnic Area"
	sound_env = PLAIN

/area/holodeck/source_snowfield
	name = "Holodeck - Snow Field"
	sound_env = FOREST

/area/holodeck/source_desert
	name = "Holodeck - Desert"
	sound_env = PLAIN

/area/holodeck/source_space
	name = "Holodeck - Space"
	has_gravity = 0
	sound_env = SPACE

// Construction Site

/area/constructionsite
	name = "Construction Site"
	icon_state = "storage"

/area/constructionsite/storage
	name = "Construction Site Storage Area"

/area/constructionsite/bridge
	name = "Construction Site Bridge"
	icon_state = "bridge"

/area/constructionsite/hallway/aft
	name = "Construction Site Aft Hallway"
	icon_state = "hallP"

/area/constructionsite/hallway/fore
	name = "Construction Site Fore Hallway"
	icon_state = "hallS"

/area/constructionsite/atmospherics
	name = "Construction Site Atmospherics"
	icon_state = "green"

/area/constructionsite/medical
	name = "Construction Site Medbay"
	icon_state = "medbay"

/area/constructionsite/ai
	name = "Construction Computer Core"
	icon_state = "ai"

/area/constructionsite/engineering
	name = "Construction Site Engine Bay"
	icon_state = "engine"

/area/constructionsite/teleporter
	name = "Construction Site Teleporter"
	icon_state = "yellow"

/area/solar/constructionsite
	name = "Construction Site Solars"
	icon_state = "aft"

/area/constructionsite/maintenance
	name = "Construction Site Maintenance"
	icon_state = "yellow"

// Engineering

/area/engineering/atmos/storage
	name = "Atmospherics Storage"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_room
	name = "Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED

/area/engineering/drone_fabrication
	name = "Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_eva
	name = "Engine EVA"
	icon_state = "engine_eva"

/area/engineering/engine_monitoring
	name = "Engine Monitoring Room"
	icon_state = "engine_monitoring"

/area/engineering/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/engineering_monitoring
	name = "Engineering Monitoring Room"
	icon_state = "engine_monitoring"

/area/engineering/foyer
	name = "Engineering Foyer"
	icon_state = "engineering_foyer"

/area/engineering/locker_room
	name = "Engineering Locker Room"
	icon_state = "engineering_locker"

/area/engineering/storage
	name = "Engineering Storage"
	icon_state = "engineering_storage"

// Medical

/area/medical/biostorage
	name = "Secondary Storage"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/genetics_cloning
	name = "Cloning Lab"
	icon_state = "cloning"

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')

/area/medical/sleeper
	name = "Emergency Treatment Centre"
	icon_state = "exam_room"

/area/medical/surgery
	name = "Operating Theatre"
	icon_state = "surgery"

// Research
/area/assembly/chargebay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/assembly/robotics
	name = "Robotics Lab"
	icon_state = "robotics"

/area/rnd/lab
	name = "Research Lab"
	icon_state = "toxlab"

/area/rnd/misc_lab
	name = "Miscellaneous Research"
	icon_state = "toxmisc"

/area/rnd/research
	name = "Research and Development"
	icon_state = "research"

// Derelict

/area/derelict/ship
	name = "Abandoned Ship"
	icon_state = "yellow"

// Construction

/area/construction
	name = "Engineering Construction Area"
	icon_state = "yellow"

// Misc
/area/AIsattele
	name = "AI Satellite Teleporter Room"
	icon_state = "teleporter"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/alien
	name = "Alien base"
	icon_state = "yellow"
	requires_power = 0

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "Alien Shuttle Base"
	requires_power = 1

// Shuttles
/area/shuttle/administration/centcom
	name = "Administration Shuttle Centcom"
	icon_state = "shuttlered"

/area/shuttle/administration/station
	name = "Administration Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod5/centcom
	icon_state = "shuttle"

/area/supply/dock
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0

// Security

/area/prison/solitary
	name = "Solitary Confinement"
	icon_state = "brig"

/area/security/armoury
	name = "Security - Armory"
	icon_state = "Warden"

/area/security/checkpoint2
	name = "Security - Checkpoint"
	icon_state = "checkpoint1"

/area/security/detectives_office
	name = "Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/security/range
	name = "Security - Firing Range"
	icon_state = "firingrange"

// Cargo
/area/quartermaster/office
	name = "Supply Office"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

// Crew

/area/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/crew_quarters/sleep/cryo
	name = "Cryogenic Storage"
	icon_state = "Sleep"

/area/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

// Tcomm
/area/tcommsat/
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/chamber
	name = "Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/computer
	name = "Telecoms Control Room"
	icon_state = "tcomsatcomp"

// AI

/area/ai_monitored
	name = "AI Monitored Area"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_cyborg_station
	name = "Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_upload_foyer
	name = " AI Upload Access"
	icon_state = "ai_foyer"
	ambience = list('sound/ambience/ambimalf.ogg')
	sound_env = SMALL_ENCLOSED

// Chapel

/area/chapel/main
	name = "Chapel"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')
	sound_env = LARGE_ENCLOSED

// Merchant

/area/merchant_station
	name = "Merchant Station"
	icon_state = "LP"

// Syndicate

/area/syndicate_mothership/raider_base
	name = "Raider Base"

// ACTORS GUILD
/area/acting
	name = "Centcom Acting Guild"
	icon_state = "red"
	lighting_use_dynamic = 0
	requires_power = 0

/area/acting/backstage
	name = "Backstage"

/area/acting/stage
	name = "Stage"
	lighting_use_dynamic = 1
	icon_state = "yellow"

// Thunderdome

/area/tdome
	name = "Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	lighting_use_dynamic = 0
	sound_env = ARENA

/area/tdome/tdome1
	name = "Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "Thunderdome (Observer.)"
	icon_state = "purple"

// GENERIC MINING AREAS

/area/mine
	icon_state = "mining"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')
	sound_env = ASTEROID

/area/mine/explored
	name = "Mine"
	icon_state = "explored"

/area/mine/unexplored
	name = "Mine"
	icon_state = "unexplored"

// OUTPOSTS