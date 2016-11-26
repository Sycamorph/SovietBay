/datum/map/exodus
	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape_pod1/centcom,
		/area/shuttle/escape_pod2/centcom,
		/area/shuttle/escape_pod3/centcom,
		/area/shuttle/escape_pod5/centcom,
		/area/shuttle/transport1/centcom,
		/area/shuttle/administration/centcom,
		/area/shuttle/specops/centcom,
	)

////////////
//SHUTTLES//
////////////
//shuttle areas must contain at least two areas in a subgroup if you want to move a shuttle from one
//place to another. Look at escape shuttle for example.
//All shuttles should now be under shuttle since we have smooth-wall code.

/area/shuttle/merchant
	icon_state = "shuttlegrn"

/area/shuttle/merchant/home
	name = "Merchant Van - Home"

/area/shuttle/merchant/away
	name = "Merchant Van - Station Side"

// Command
/area/crew_quarters/heads/chief
	name = "Engineering - CE's Office"

/area/crew_quarters/heads/hos
	name = "Security - HoS' Office"

/area/crew_quarters/heads/hop
	name = "Command - HoP's Office"

/area/crew_quarters/heads/hor
	name = "Research - RD's Office"

/area/crew_quarters/heads/cmo
	name = "Command - CMO's Office"

// Shuttles

/area/shuttle/constructionsite
	name = "Construction Site Shuttle"
	icon_state = "yellow"

/area/shuttle/constructionsite/station
	name = "Construction Site Shuttle"

/area/shuttle/mining
	name = "Mining Shuttle"

/area/shuttle/mining/outpost
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor/asteroid

/area/shuttle/mining/station
	icon_state = "shuttle2"

/area/shuttle/specops/centcom
	name = "Special Ops Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/administration
	flags = RAD_SHIELDED

/area/shuttle/syndicate_elite
	name = "Merc Elite Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "Transport Shuttle Centcom"

/area/shuttle/transport1/station
	icon_state = "shuttle"
	name = "Transport Shuttle"

/area/shuttle/alien/mine
	icon_state = "shuttle"
	name = "Alien Shuttle Mine"
	requires_power = 1

/area/shuttle/arrival
	name = "Arrival Shuttle"

/area/shuttle/arrival/station
	icon_state = "shuttle"

/area/shuttle/escape
	name = "Emergency Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/escape/station
	name = "Emergency Shuttle Station"
	icon_state = "shuttle2"

/area/shuttle/escape/transit // the area to pass through for 3 minute transit
	name = "Emergency Shuttle Transit"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/shuttle/escape_pod1
	name = "Escape Pod One"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod1/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/shuttle/escape_pod2
	name = "Escape Pod Two"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod2/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/shuttle/escape_pod3
	name = "Escape Pod Three"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod3/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/east/shuttlespace_ew1

/area/shuttle/escape_pod5 //Pod 4 was lost to meteors
	name = "Escape Pod Five"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod5/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod5/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/east/shuttlespace_ew1

// === Trying to remove these areas:

/area/shuttle/research
	name = "Research Shuttle"

/area/shuttle/research/station
	icon_state = "shuttle2"

/area/shuttle/research/outpost
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor/asteroid


//SYNDICATES

/area/syndicate_mothership
	name = "Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	lighting_use_dynamic = 0

/area/syndicate_mothership/ninja
	name = "Ninja Base"

//RESCUE

//names are used
/area/rescue_base
	name = "Response Team Base"
	icon_state = "yellow"
	requires_power = 0
	lighting_use_dynamic = 1
	flags = RAD_SHIELDED

/area/rescue_base/base
	name = "Barracks"
	icon_state = "yellow"
	lighting_use_dynamic = 0

/area/rescue_base/start
	name = "Response Team Base"
	icon_state = "shuttlered"
	base_turf = /turf/unsimulated/floor/rescue_base

/area/rescue_base/southwest
	name = "south-west of SS13"
	icon_state = "southwest"

/area/rescue_base/northwest
	name = "north-west of SS13"
	icon_state = "northwest"

/area/rescue_base/northeast
	name = "north-east of SS13"
	icon_state = "northeast"

/area/rescue_base/southeast
	name = "south-east of SS13"
	icon_state = "southeast"

/area/rescue_base/north
	name = "north of SS13"
	icon_state = "north"

/area/rescue_base/south
	name = "south of SS13"
	icon_state = "south"

/area/rescue_base/commssat
	name = "west of the communication satellite"
	icon_state = "west"

/area/rescue_base/mining
	name = "northeast of the engineering station"
	icon_state = "northeast"
	base_turf = /turf/simulated/floor/asteroid

/area/rescue_base/arrivals_dock
	name = "docked with station"
	icon_state = "shuttle"

/area/rescue_base/transit
	name = " bluespace"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

//ENEMY

//names are used
/area/syndicate_station
	name = "Independant Station"
	icon_state = "yellow"
	requires_power = 0
	flags = RAD_SHIELDED

/area/syndicate_station/start
	name = "Mercenary Forward Operating Base"
	icon_state = "yellow"

/area/syndicate_station/southwest
	name = "south-west of SS13"
	icon_state = "southwest"

/area/syndicate_station/northwest
	name = "north-west of SS13"
	icon_state = "northwest"

/area/syndicate_station/northeast
	name = "north-east of SS13"
	icon_state = "northeast"

/area/syndicate_station/southeast
	name = "south-east of SS13"
	icon_state = "southeast"

/area/syndicate_station/north
	name = "north of SS13"
	icon_state = "north"

/area/syndicate_station/south
	name = "south of SS13"
	icon_state = "south"

/area/syndicate_station/commssat
	name = "south of the communication satellite"
	icon_state = "south"

/area/syndicate_station/mining
	name = "northeast of the mining station"
	icon_state = "north"
	base_turf = /turf/simulated/floor/asteroid

/area/syndicate_station/arrivals_dock
	name = "docked with station"
	icon_state = "shuttle"

/area/syndicate_station/transit
	name = " bluespace"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/skipjack_station
	name = "Skipjack"
	icon_state = "yellow"
	requires_power = 0

/area/skipjack_station/transit
	name = " bluespace"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/skipjack_station/southwest_solars
	name = "aft port solars"
	icon_state = "southwest"

/area/skipjack_station/northwest_solars
	name = "fore port solars"
	icon_state = "northwest"

/area/skipjack_station/northeast_solars
	name = "fore starboard solars"
	icon_state = "northeast"

/area/skipjack_station/southeast_solars
	name = "aft starboard solars"
	icon_state = "southeast"

/area/skipjack_station/mining
	name = "south of mining station"
	icon_state = "north"
	base_turf = /turf/simulated/floor/asteroid

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED

/area/maintenance/substation/command // AI and central cluster. This one will be between HoP office and meeting room (probably).
	name = "Command Substation"

/area/maintenance/substation/engineering // Probably will be connected to engineering SMES room, as wires cannot be crossed properly without them sharing powernets.
	name = "Engineering Substation"

/area/maintenance/substation/medical // Medbay
	name = "Medical Substation"

/area/maintenance/substation/research // Research
	name = "Research Substation"

/area/maintenance/substation/civilian_east // Bar, kitchen, dorms, ...
	name = "Civilian East Substation"

/area/maintenance/substation/civilian_west // Cargo, PTS, locker room, probably arrivals, ...)
	name = "Civilian West Substation"

/area/maintenance/substation/security // Security, Brig, Permabrig, etc.
	name = "Security Substation"

// Maintenance

/area/maintenance/atmos_control
	name = "Atmospherics Maintenance"
	icon_state = "fpmaint"

/area/maintenance/arrivals
	name = "Arrivals Maintenance"
	icon_state = "maint_arrivals"

/area/maintenance/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/maintenance/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/maintenance/engi_engine
	name = "Engine Maintenance"
	icon_state = "maint_engine"

/area/maintenance/engi_shuttle
	name = "Engineering Shuttle Access"
	icon_state = "maint_e_shuttle"

/area/maintenance/engineering
	name = "Engineering Maintenance"
	icon_state = "maint_engineering"

/area/maintenance/evahallway
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/dormitory
	name = "Dormitory Maintenance"
	icon_state = "maint_dormitory"

/area/maintenance/library
	name = "Library Maintenance"
	icon_state = "maint_library"

/area/maintenance/locker
	name = "Locker Room Maintenance"
	icon_state = "maint_locker"

/area/maintenance/medbay
	name = "Medbay Maintenance"
	icon_state = "maint_medbay"

/area/maintenance/research_port
	name = "Research Maintenance - Port"
	icon_state = "maint_research_port"

/area/maintenance/research_shuttle
	name = "Research Shuttle Dock Maintenance"
	icon_state = "maint_research_shuttle"

/area/maintenance/research_starboard
	name = "Research Maintenance - Starboard"
	icon_state = "maint_research_starboard"

/area/maintenance/security_port
	name = "Security Maintenance - Port"
	icon_state = "maint_security_port"

/area/maintenance/security_starboard
	name = "Security Maintenance - Starboard"
	icon_state = "maint_security_starboard"

/area/maintenance/exterior
	name = "\improper Exterior Reinforcements"
	icon_state = "maint_security_starboard"

// Hallway

/area/hallway/primary/
	sound_env = LARGE_ENCLOSED

/area/hallway/primary/fore
	name = "Fore Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/starboard
	name = "Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/aft
	name = "Aft Primary Hallway"
	icon_state = "hallA"

/area/hallway/primary/port
	name = "Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/central_one
	name = "Central Primary Hallway"
	icon_state = "hallC1"

/area/hallway/primary/central_two
	name = "Central Primary Hallway"
	icon_state = "hallC2"

/area/hallway/primary/central_three
	name = "Central Primary Hallway"
	icon_state = "hallC3"

/area/hallway/secondary/exit
	name = "Escape Shuttle Hallway"
	icon_state = "escape"

/area/hallway/secondary/entry/pods
	name = "Arrival Shuttle Hallway - Escape Pods"
	icon_state = "entry_pods"

/area/hallway/secondary/entry/fore
	name = "Arrival Shuttle Hallway - Fore"
	icon_state = "entry_1"

/area/hallway/secondary/entry/port
	name = "Arrival Shuttle Hallway - Port"
	icon_state = "entry_2"

/area/hallway/secondary/entry/starboard
	name = "Arrival Shuttle Hallway - Starboard"
	icon_state = "entry_3"

/area/hallway/secondary/entry/aft
	name = "Arrival Shuttle Hallway - Aft"
	icon_state = "entry_4"

// Command

/area/crew_quarters/captain
	name = "Command - Captain's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR

// Crew

/area/crew_quarters
	name = "Dormitories"
	icon_state = "Sleep"
	flags = RAD_SHIELDED

/area/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/sleep
	name = "Dormitories"
	icon_state = "Sleep"

/area/crew_quarters/sleep/engi_wash
	name = "Engineering Washroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/sleep/bedrooms
	name = "Dormitory Bedroom One"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR

/area/crew_quarters/locker/locker_toilet
	name = "Locker Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/crew_quarters/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR

/area/library
 	name = "Library"
 	icon_state = "library"
 	sound_env = LARGE_SOFTFLOOR

/area/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/lawoffice
	name = "Internal Affairs"
	icon_state = "law"

//Engineering

/area/engineering/
	name = "Engineering"
	icon_state = "engineering"
	ambience = list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg')

/area/engineering/atmos
 	name = "Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED

/area/engineering/engine_airlock
	name = "Engine Room Airlock"
	icon_state = "engine"

/area/engineering/engine_waste
	name = "Engine Waste Handling"
	icon_state = "engine_waste"

/area/engineering/break_room
	name = "Engineering Break Room"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR

/area/engineering/workshop
	name = "Engineering Workshop"
	icon_state = "engineering_workshop"

// Medbay

/area/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"

// Solars

/area/solar
	requires_power = 1
	always_unpowered = 1
	lighting_use_dynamic = 0
	base_turf = /turf/space

/area/solar/starboard
	name = "Starboard Auxiliary Solar Array"
	icon_state = "panelsS"

/area/solar/auxport
	name = "Fore Port Solar Array"
	icon_state = "panelsA"

/area/solar/fore
	name = "Fore Solar Array"
	icon_state = "yellow"

/area/maintenance/foresolar
	name = "Solar Maintenance - Fore"
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED

/area/maintenance/portsolar
	name = "Solar Maintenance - Aft Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

/area/maintenance/starboardsolar
	name = "Solar Maintenance - Aft Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

//Teleporter

/area/teleporter
	name = "Teleporter"
	icon_state = "teleporter"

/area/gateway
	name = "Gateway"
	icon_state = "teleporter"

//MedBay

/area/medical/medbay
	name = "Medbay Hallway - Port"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

//Medbay is a large area, these additional areas help level out APC load.
/area/medical/medbay2
	name = "Medbay Hallway - Starboard"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/medbay3
	name = "Medbay Hallway - Fore"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/medbay4
	name = "Medbay Hallway - Aft"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/reception
	name = "Medbay Reception"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/psych
	name = "Psych Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/crew_quarters/medbreak
	name = "Break Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/ward
	name = "Recovery Ward"
	icon_state = "patients"

/area/medical/patient_a
	name = "Isolation A"
	icon_state = "patients"

/area/medical/patient_b
	name = "Isolation B"
	icon_state = "patients"

/area/medical/patient_c
	name = "Isolation C"
	icon_state = "patients"

/area/medical/patient_wing
	name = "Patient Wing"
	icon_state = "patients"

/area/medical/patient_wing/washroom
	name = "Patient Wing Washroom"

/area/medical/surgery2
	name = "Operating Theatre 2"
	icon_state = "surgery"

/area/medical/surgeryobs
	name = "Operation Observation Room"
	icon_state = "surgery"

/area/medical/surgeryprep
	name = "Pre-Op Prep Room"
	icon_state = "surgery"

/area/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

//Security

/area/security/main
	name = "Security Office"
	icon_state = "security"

/area/security/meeting
	name = "Security Meeting Room"
	icon_state = "security"

/area/security/lobby
	name = "Security Lobby"
	icon_state = "security"

/area/security/brig/processing
	name = "Security - Processing"
	icon_state = "brig"

/area/security/brig/interrogation
	name = "Security - Interrogation"
	icon_state = "brig"

/area/security/brig/solitaryA
	name = "Security - Solitary 1"
	icon_state = "sec_prison"

/area/security/brig/solitaryB
	name = "Security - Solitary 2"
	icon_state = "sec_prison"

/area/security/brig/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.locked = 0
		temp_closet.icon_state = temp_closet.icon_closed
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/security/prison/restroom
	name = "Security - Prison Wing Restroom"
	icon_state = "sec_prison"

/area/security/prison/dorm
	name = "Security - Prison Wing Dormitory"
	icon_state = "sec_prison"

/area/security/prison/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.locked = 0
		temp_closet.icon_state = temp_closet.icon_closed
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/security/warden
	name = "Security - Warden's Office"
	icon_state = "Warden"

/area/security/tactical
	name = "Security - Tactical Equipment"
	icon_state = "Tactical"

/area/security/vacantoffice
	name = "Vacant Office"
	icon_state = "security"

/area/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

/area/quartermaster/qm
	name = "Cargo - Quartermaster's Office"
	icon_state = "quart"

/area/quartermaster/miningdock
	name = "Cargo Mining Dock"
	icon_state = "mining"

/area/hydroponics/garden
	name = "Garden"
	icon_state = "garden"


// Research
/area/rnd/docking
	name = "Research Dock"
	icon_state = "research_dock"

/area/rnd/mixing
	name = "Toxins Mixing Room"
	icon_state = "toxmix"

/area/rnd/storage
	name = "Toxins Storage"
	icon_state = "toxstorage"

area/rnd/test_area
	name = "Toxins Test Area"
	icon_state = "toxtest"

/area/server
	name = "Research Server Room"
	icon_state = "server"

//Storage

/area/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/storage/emergency
	name = "Starboard Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency2
	name = "Port Emergency Storage"
	icon_state = "emergencystorage"

//HALF-BUILT STATION (REPLACES DERELICT IN BAYCODE, ABOVE IS LEFT FOR DOWNSTREAM)

/area/shuttle/constructionsite/site
	name = "Construction Site Shuttle"
	base_turf = /turf/simulated/floor/asteroid

//AI

/area/turret_protected/ai_server_room
	name = "Messaging Server Room"
	icon_state = "ai_server"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/tcomsat/port
	name = "Telecoms Satellite - Port"

/area/turret_protected/tcomsat/starboard
	name = "Telecoms Satellite - Starboard"

//Misc

// Telecommunications Satellite

/area/tcommsat/entrance
	name = "Telecoms Teleporter"
	icon_state = "tcomsatentrance"

/area/turret_protected/tcomsat
	name = "Telecoms Satellite"
	icon_state = "tcomsatlob"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/turret_protected/tcomfoyer
	name = "Telecoms Foyer"
	icon_state = "tcomsatentrance"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/powercontrol
	name = "Telecommunications Power Control"
	icon_state = "tcomsatwest"

/*******
* Moon *
*******/

// Experimental Addition

/area/event/bars
	name = "Unknown"
	icon_state = "unexplored"
	base_turf = /turf/simulated/floor/asteroid/withair
	lighting_use_dynamic = 0

/area/shuttle/train
	name = "Train"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train/station
	name = "Train"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train/desert
	name = "Train Desert"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train/attack
	name = "Train Railway"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train/tunnel
	name = "Train Tunnel"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train/end
	name = "Train End"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train2
	name = "Train Enemy"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train2/station
	name = "Train Attack"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/train2/attack
	name = "Train Attack"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/eventshuttle/station
	name = "Unknown Shuttle"
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor
	lighting_use_dynamic = 0

/area/shuttle/eventshuttle/space
	name = "Unknown Shuttle"
	icon_state = "shuttle"
	base_turf = /turf/space
	lighting_use_dynamic = 0

// Mining main outpost

/area/outpost/mining_main
	icon_state = "outpost_mine_main"

/area/outpost/mining_main/east_hall
	name = "Mining Outpost East Hallway"

/area/outpost/mining_main/eva
	name = "Mining Outpost EVA storage"

/area/outpost/mining_main/dorms
	name = "Mining Outpost Dormitory"

/area/outpost/mining_main/medbay
	name = "Mining Outpost Medical"

/area/outpost/mining_main/refinery
	name = "Mining Outpost Refinery"

/area/outpost/mining_main/west_hall
	name = "Mining Outpost West Hallway"

// Mining outpost
/area/outpost/mining_main/maintenance
	name = "Mining Outpost Maintenance"

// Small outposts
/area/outpost/mining_north
	name = "North Mining Outpost"
	icon_state = "outpost_mine_north"

/area/outpost/mining_west
	name = "West Mining Outpost"
	icon_state = "outpost_mine_west"

// Engineering outpost

/area/outpost/engineering
	icon_state = "outpost_engine"

/area/outpost/engineering/atmospherics
	name = "Engineering Outpost Atmospherics"

/area/outpost/engineering/hallway
	name = "Engineering Outpost Hallway"

/area/outpost/engineering/power
	name = "Engineering Outpost Power Distribution"

/area/outpost/engineering/telecomms
	name = "Engineering Outpost Telecommunications"

/area/outpost/engineering/storage
	name = "Engineering Outpost Storage"

/area/outpost/engineering/meeting
	name = "Engineering Outpost Meeting Room"

// Research Outpost
/area/outpost/research
	icon_state = "outpost_research"

/area/outpost/research/hallway
	name = "Research Outpost Hallway"

/area/outpost/research/dock
	name = "Research Outpost Shuttle Dock"

/area/outpost/research/eva
	name = "Research Outpost EVA"

/area/outpost/research/analysis
	name = "Research Outpost Sample Analysis"

/area/outpost/research/chemistry
	name = "Research Outpost Chemistry"

/area/outpost/research/medical
	name = "Research Outpost Medical"

/area/outpost/research/power
	name = "Research Outpost Maintenance"

/area/outpost/research/isolation_a
	name = "Research Outpost Isolation A"

/area/outpost/research/isolation_b
	name = "Research Outpost Isolation B"

/area/outpost/research/isolation_c
	name = "Research Outpost Isolation C"

/area/outpost/research/isolation_monitoring
	name = "Research Outpost Isolation Monitoring"

/area/outpost/research/lab
	name = "Research Outpost Laboratory"

/area/outpost/research/emergency_storage
	name = "Research Outpost Emergency Storage"

/area/outpost/research/anomaly_storage
	name = "Research Outpost Anomalous Storage"

/area/outpost/research/anomaly_analysis
	name = "Research Outpost Anomaly Analysis"

/area/outpost/research/kitchen
	name = "Research Outpost Kitchen"

/area/outpost/research/disposal
	name = "Research Outpost Waste Disposal"
