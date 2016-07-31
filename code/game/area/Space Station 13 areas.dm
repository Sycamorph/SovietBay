/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = "ICON FILENAME" 			(defaults to areas.dmi)
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = 0 				(defaults to 1)

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/



/area
	var/fire = null
	var/atmos = 1
	var/atmosalm = 0
	var/poweralm = 1
	var/party = null
	level = null
	name = "Unknown"
	icon = 'icons/turf/areas.dmi'
	icon_state = "unknown"
	layer = 10
	luminosity = 0
	mouse_opacity = 0
	var/lightswitch = 1

	var/eject = null

	var/debug = 0
	var/requires_power = 1
	var/always_unpowered = 0	//this gets overriden to 1 for space in area/New()

	var/power_equip = 1
	var/power_light = 1
	var/power_environ = 1
	var/used_equip = 0
	var/used_light = 0
	var/used_environ = 0

	var/has_gravity = 1
	var/obj/machinery/power/apc/apc = null
	var/no_air = null
//	var/list/lights				// list of all lights on this area
	var/list/all_doors = list()		//Added by Strumpetplaya - Alarm Change - Contains a list of doors adjacent to this area
	var/air_doors_activated = 0
	var/list/ambience = list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg')
	var/list/forced_ambience = null
	var/sound_env = STANDARD_STATION
	var/turf/base_turf //The base turf type of the area, which can be used to override the z-level's base turf

/*Adding a wizard area teleport list because motherfucking lag -- Urist*/
/*I am far too lazy to make it a proper list of areas so I'll just make it run the usual telepot routine at the start of the game*/
var/list/teleportlocs = list()

/hook/startup/proc/setupTeleportLocs()
	for(var/area/AR in world)
		if(istype(AR, /area/shuttle) || istype(AR, /area/syndicate_station) || istype(AR, /area/wizard_station)) continue
		if(teleportlocs.Find(AR.name)) continue
		var/turf/picked = pick_area_turf(AR.type, list(/proc/is_station_turf))
		if (picked)
			teleportlocs += AR.name
			teleportlocs[AR.name] = AR

	teleportlocs = sortAssoc(teleportlocs)

	return 1

var/list/ghostteleportlocs = list()

/hook/startup/proc/setupGhostTeleportLocs()
	for(var/area/AR in world)
		if(!AR.x)
			continue
		if(ghostteleportlocs.Find(AR.name)) continue
		var/turf/picked = pick_area_turf(AR.type)
		if (picked)
			ghostteleportlocs[AR.name] = AR

	ghostteleportlocs = sortAssoc(ghostteleportlocs)

	return 1

/*-----------------------------------------------------------------------------*/

/////////
//SPACE//
/////////

/area/space
	name = "Space"
	icon_state = "unknown"
	requires_power = 1
	always_unpowered = 1
	lighting_use_dynamic = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
	ambience = list('sound/ambience/ambispace.ogg','sound/music/title2.ogg','sound/music/space.ogg','sound/music/main.ogg','sound/music/traitor.ogg')

/area/space/updateicon()
	return

area/space/atmosalert()
	return

/area/space/fire_alert()
	return

/area/space/fire_reset()
	return

/area/space/readyalert()
	return

/area/space/partyalert()
	return

/area/turret_protected

/area/arrival
	requires_power = 0

/area/arrival/start
	name = "Arrival Area"
	icon_state = "start"

/area/admin
	name = "Admin room"
	icon_state = "start"



////////////
//SHUTTLES//
////////////
//shuttle areas must contain at least two areas in a subgroup if you want to move a shuttle from one
//place to another. Look at escape shuttle for example.
//All shuttles should now be under shuttle since we have smooth-wall code.

/area/shuttle
	requires_power = 0
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/space

/area/supply/station
	name = "Supply Shuttle"
	icon_state = "shuttle3"

/area/shuttle/mining
	name = "Mining Shuttle"

/area/shuttle/mining/station
	icon_state = "shuttle2"

/area/shuttle/mining/outpost
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor/asteroid

/area/shuttle/specops/centcom
	name = "Special Ops Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/specops/centcom
	icon_state = "shuttlered"

/area/shuttle/specops/station
	icon_state = "shuttlered2"

/area/shuttle/administration
	flags = RAD_SHIELDED

/area/shuttle/administration/centcom
	name = "Administration Shuttle Centcom"
	icon_state = "shuttlered"

/area/shuttle/administration/station
	name = "Administration Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/syndicate_elite
	name = "Merc Elite Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/syndicate_elite/mothership
	icon_state = "shuttlered"

/area/shuttle/syndicate_elite/station
	icon_state = "shuttlered2"

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "Alien Shuttle Base"
	requires_power = 1

/area/shuttle/prison/prison
	icon_state = "shuttle2"

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

/area/shuttle/arrival/pre_game
	icon_state = "shuttle2"

/area/shuttle/arrival/station
	icon_state = "shuttle"

/area/shuttle/escape
	name = "Emergency Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/escape/station
	name = "Emergency Shuttle Station"
	icon_state = "shuttle2"

/area/shuttle/escape/centcom
	name = "Emergency Shuttle Centcom"
	icon_state = "shuttle"

/area/shuttle/escape/transit // the area to pass through for 3 minute transit
	name = "Emergency Shuttle Transit"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/shuttle/escape_pod1
	name = "Escape Pod One"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod1/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/shuttle/escape_pod2
	name = "Escape Pod Two"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod2/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/shuttle/escape_pod3
	name = "Escape Pod Three"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod3/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/east/shuttlespace_ew1

/area/shuttle/escape_pod5 //Pod 4 was lost to meteors
	name = "Escape Pod Five"
	flags = RAD_SHIELDED

/area/shuttle/escape_pod5/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod5/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod5/transit
	icon_state = "shuttle"
	base_turf = /turf/space/transit/east/shuttlespace_ew1

/area/shuttle/mining
	name = "Mining Shuttle"

/area/shuttle/mining/station
	icon_state = "shuttle2"

/area/shuttle/mining/outpost
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor/asteroid

/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "Transport Shuttle Centcom"

/area/shuttle/transport1/station
	icon_state = "shuttle"
	name = "Transport Shuttle"

/area/shuttle/alien/base
	icon_state = "shuttle"
	name = "Alien Shuttle Base"
	requires_power = 1

/area/shuttle/alien/mine
	icon_state = "shuttle"
	name = "Alien Shuttle Mine"
	requires_power = 1

/area/shuttle/prison/
	name = "Prison Shuttle"

/area/shuttle/prison/station
	icon_state = "shuttle"

/area/shuttle/prison/prison
	icon_state = "shuttle2"

/area/shuttle/specops/centcom
	name = "Special Ops Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/specops/centcom
	icon_state = "shuttlered"

/area/shuttle/specops/station
	icon_state = "shuttlered2"

/area/shuttle/syndicate_elite
	name = "Merc Elite Shuttle"
	flags = RAD_SHIELDED

/area/shuttle/syndicate_elite/mothership
	icon_state = "shuttlered"

/area/shuttle/syndicate_elite/station
	icon_state = "shuttlered2"

/area/shuttle/breach/centcom
	name = "Breach Shuttle Centcom"
	icon_state = "shuttlered"

/area/shuttle/breach/station
	name = "Breach Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/administration
	flags = RAD_SHIELDED

/area/shuttle/administration/centcom
	name = "Administration Shuttle Centcom"
	icon_state = "shuttlered"

/area/shuttle/administration/station
	name = "Administration Shuttle"
	icon_state = "shuttlered2"

/area/shuttle/thunderdome
	name = "honk"

/area/shuttle/thunderdome/grnshuttle
	name = "Thunderdome GRN Shuttle"
	icon_state = "green"

/area/shuttle/thunderdome/grnshuttle/dome
	name = "GRN Shuttle"
	icon_state = "shuttlegrn"

/area/shuttle/thunderdome/grnshuttle/station
	name = "GRN Station"
	icon_state = "shuttlegrn2"

/area/shuttle/thunderdome/redshuttle
	name = "Thunderdome RED Shuttle"
	icon_state = "red"

/area/shuttle/thunderdome/redshuttle/dome
	name = "RED Shuttle"
	icon_state = "shuttlered"

/area/shuttle/thunderdome/redshuttle/station
	name = "RED Station"
	icon_state = "shuttlered2"
// === Trying to remove these areas:

/area/shuttle/research
	name = "Research Shuttle"

/area/shuttle/research/station
	icon_state = "shuttle2"

/area/shuttle/research/outpost
	icon_state = "shuttle"
	base_turf = /turf/simulated/floor/asteroid

/area/airtunnel1/      // referenced in airtunnel.dm:759

/area/dummy/           // Referenced in engine.dm:261

// === end remove

/area/alien
	name = "Alien base"
	icon_state = "yellow"
	requires_power = 0

// CENTCOM

/area/centcom
	name = "Centcom"
	icon_state = "centcom"
	requires_power = 0
	lighting_use_dynamic = 0

/area/centcom/control
	name = "Centcom Control"

/area/centcom/evac
	name = "Centcom Emergency Shuttle"

/area/centcom/suppy
	name = "Centcom Supply Shuttle"

/area/centcom/ferry
	name = "Centcom Transport Shuttle"

/area/centcom/shuttle
	name = "Centcom Administration Shuttle"

/area/centcom/test
	name = "Centcom Testing Facility"

/area/centcom/living
	name = "Centcom Living Quarters"

/area/centcom/specops
	name = "Centcom Special Ops"

/area/centcom/creed
	name = "Creed's Office"

/area/centcom/holding
	name = "Holding Facility"

/area/centcom/breach
	name = "Breach Facility"

//MARINES (copypasta from syndicates)

//SYNDICATES

/area/syndicate_mothership
	name = "Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	lighting_use_dynamic = 0

/area/syndicate_mothership/control
	name = "Mercenary Control Room"
	icon_state = "syndie-control"

/area/syndicate_mothership/elite_squad
	name = "Elite Mercenary Squad"
	icon_state = "syndie-elite"

/area/syndicate_mothership/ninja
	name = "Ninja Base"

//EXTRA

/area/asteroid					// -- TLE
	name = "Moon"
	icon_state = "asteroid"
	requires_power = 0
	sound_env = ASTEROID

/area/asteroid/cave				// -- TLE
	name = "Moon - Underground"
	icon_state = "cave"
	requires_power = 0
	sound_env = ASTEROID

/area/asteroid/artifactroom
	name = "Moon - Artifact"
	icon_state = "cave"
	sound_env = SMALL_ENCLOSED















/area/planet/clown
	name = "Clown Planet"
	icon_state = "honk"
	requires_power = 0

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

//ACTORS GUILD
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
	name = "bluespace"
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

/area/syndicate_station/maint_dock
	name = "docked with station"
	icon_state = "shuttle"

/area/syndicate_station/transit
	name = "bluespace"
	icon_state = "shuttle"
	base_turf = /turf/space/transit/north/shuttlespace_ns1

/area/wizard_station
	name = "Wizard's Den"
	icon_state = "yellow"
	requires_power = 0
	lighting_use_dynamic = 0

/area/skipjack_station
	name = "Skipjack"
	icon_state = "yellow"
	requires_power = 0

/area/skipjack_station/start
	name = "Skipjack"
	icon_state = "yellow"

/area/skipjack_station/transit
	name = "bluespace"
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

//PRISON
/area/shuttle/prison/
	name = "Prison Shuttle"

/area/shuttle/prison/station
	icon_state = "shuttle"

/area/prison
	name = "Prison Station"
	icon_state = "brig"

/area/prison/arrival_airlock
	name = "Prison Station Airlock"
	icon_state = "green"
	requires_power = 0

/area/prison/control
	name = "Prison Security Checkpoint"
	icon_state = "security"

/area/prison/crew_quarters
	name = "Prison Security Quarters"
	icon_state = "security"

/area/prison/rec_room
	name = "Prison Rec Room"
	icon_state = "green"

/area/prison/closet
	name = "Prison Supply Closet"
	icon_state = "dk_yellow"

/area/prison/hallway/fore
	name = "Prison Fore Hallway"
	icon_state = "yellow"

/area/prison/hallway/aft
	name = "Prison Aft Hallway"
	icon_state = "yellow"

/area/prison/hallway/port
	name = "Prison Port Hallway"
	icon_state = "yellow"

/area/prison/hallway/starboard
	name = "Prison Starboard Hallway"
	icon_state = "yellow"

/area/prison/morgue
	name = "Prison Morgue"
	icon_state = "morgue"

/area/prison/medical_research
	name = "Prison Genetic Research"
	icon_state = "medresearch"

/area/prison/medical
	name = "Prison Medbay"
	icon_state = "medbay"

/area/prison/solar
	name = "Prison Solar Array"
	icon_state = "storage"
	requires_power = 0

/area/prison/podbay
	name = "Prison Podbay"
	icon_state = "dk_yellow"

/area/prison/solar_control
	name = "Prison Solar Array Control"
	icon_state = "dk_yellow"

/area/prison/solitary
	name = "Solitary Confinement"
	icon_state = "brig"

/area/prison/cell_block/A
	name = "Prison Cell Block A"
	icon_state = "brig"

/area/prison/cell_block/B
	name = "Prison Cell Block B"
	icon_state = "brig"

/area/prison/cell_block/C
	name = "Prison Cell Block C"
	icon_state = "brig"

////////////////////
//SPACE STATION 13//
////////////////////

//Maintenance

/area/maintenance
	flags = RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()

/area/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/maintenance/fore
	name = "Fore Maintenance"
	icon_state = "fmaint"

/area/maintenance/starboard
	name = "Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/atmos_control
	name = "Atmospherics Maintenance"
	icon_state = "fpmaint"

/area/maintenance/fpmaint
	name = "Fore Port Maintenance - 1"
	icon_state = "fpmaint"

/area/maintenance/fpmaint2
	name = "Fore Port Maintenance - 2"
	icon_state = "fpmaint"

/area/maintenance/fsmaint
	name = "Fore Starboard Maintenance - 1"
	icon_state = "fsmaint"

/area/maintenance/fsmaint2
	name = "Fore Starboard Maintenance - 2"
	icon_state = "fsmaint"

/area/maintenance/asmaint
	name = "Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/engi_shuttle
	name = "Engineering Shuttle Access"
	icon_state = "maint_e_shuttle"

/area/maintenance/engi_engine
	name = "Engine Maintenance"
	icon_state = "maint_engine"

/area/maintenance/asmaint2
	name = "Science Maintenance"
	icon_state = "asmaint"

/area/maintenance/apmaint
	name = "Cargo Maintenance"
	icon_state = "apmaint"

/area/maintenance/maintcentral
	name = "Bridge Maintenance"
	icon_state = "maintcentral"

/area/maintenance/arrivals
	name = "Arrivals Maintenance"
	icon_state = "maint_arrivals"

/area/maintenance/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/maintenance/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/engineering
	name = "Engineering Maintenance"
	icon_state = "maint_engineering"

/area/maintenance/evahallway
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/dormitory
	name = "Dormitory Maintenance"
	icon_state = "maint_dormitory"

/area/maintenance/incinerator
	name = "Incinerator"
	icon_state = "disposal"

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

/area/maintenance/research_starboard
	name = "Research Maintenance - Starboard"
	icon_state = "maint_research_starboard"

/area/maintenance/research_shuttle
	name = "Research Shuttle Dock Maintenance"
	icon_state = "maint_research_shuttle"

/area/maintenance/security_port
	name = "Security Maintenance - Port"
	icon_state = "maint_security_port"

/area/maintenance/security_starboard
	name = "Security Maintenance - Starboard"
	icon_state = "maint_security_starboard"

/area/maintenance/storage
	name = "Atmospherics"
	icon_state = "green"

// SUBSTATIONS (Subtype of maint, that should let them serve as shielded area during radstorm)

/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED

/area/maintenance/substation/engineering // Probably will be connected to engineering SMES room, as wires cannot be crossed properly without them sharing powernets.
	name = "Engineering Substation"

// No longer used:
/area/maintenance/substation/medical_science // Medbay and Science. Each has it's own separated machinery, but it originates from the same room.
	name = "Medical Research Substation"

/area/maintenance/substation/medical // Medbay
	name = "Medical Substation"

/area/maintenance/substation/research // Research
	name = "Research Substation"

/area/maintenance/substation/civilian_east // Bar, kitchen, dorms, ...
	name = "Civilian East Substation"

/area/maintenance/substation/civilian_west // Cargo, PTS, locker room, probably arrivals, ...)
	name = "Civilian West Substation"

/area/maintenance/substation/command // AI and central cluster. This one will be between HoP office and meeting room (probably).
	name = "Command Substation"

/area/maintenance/substation/security // Security, Brig, Permabrig, etc.
	name = "Security Substation"





//Hallway

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

/area/hallway/secondary/construction
	name = "Construction Area"
	icon_state = "construction"

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

//Command

/area/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/captain
	name = "Command - Captain's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/hop
	name = "Command - HoP's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/cobed
	name = "Command - CO's Quarters"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/hor
	name = "Research - RD's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/chief
	name = "Engineering - CE's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hos
	name = "Security - HoS' Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/cmo
	name = "Command - CMO's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/co
	name = "Command - CO's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR

/area/crew_quarters/heads/office/xo
	name = "Command - XO's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/rd
	name = "Command - RD's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/cmo
	name = "Command - CMO's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/ce
	name = "Engineering - CE's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/cos
	name = "Command - CoS' Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/cl
	name = "Command - CL's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/office/sgr
	name = "Command - SCGR's Office"
	icon_state = "head_quarters"

/area/crew_quarters/courtroom
	name = "Courtroom"
	icon_state = "courtroom"

/area/mint
	name = "Mint"
	icon_state = "green"

/area/comms
	name = "Communications Relay"
	icon_state = "tcomsatcham"

/area/server
	name = "Research Server Room"
	icon_state = "server"

//Crew

/area/crew_quarters
	name = "Dormitories"
	icon_state = "Sleep"
	flags = RAD_SHIELDED

/area/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/head
	name = "Head"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/lounge
	name = "Lounge"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

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

/area/crew_quarters/sleep/bunk
	name = "Bunk Room"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR

/area/crew_quarters/sleep/cryo
	name = "Cryogenic Storage"
	icon_state = "Sleep"

/area/crew_quarters/cryolocker
	name = "Cryogenic Storage Wardrobe"
	icon_state = "locker"

/area/crew_quarters/sleep/cryo/aux
	name = "Auxiliary Cryogenic Storage"
	icon_state = "Sleep"

/area/crew_quarters/sleep_male
	name = "Male Dorm"
	icon_state = "Sleep"

/area/crew_quarters/sleep_male/toilet_male
	name = "Male Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/sleep_female
	name = "Female Dorm"
	icon_state = "Sleep"

/area/crew_quarters/sleep_female/toilet_female
	name = "Female Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/crew_quarters/storage
	name = "Crew Storage"
	icon_state = "locker"

/area/crew_quarters/locker/locker_toilet
	name = "Locker Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/crew_quarters/cafeteria
	name = "Cafeteria"
	icon_state = "cafeteria"

/area/crew_quarters/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/crew_quarters/galley
	name = "Galley"
	icon_state = "kitchen"

/area/crew_quarters/galleybackroom
	name = "Galley Cold Storage"
	icon_state = "kitchen"

/area/crew_quarters/mess
	name = "Mess Hall"
	icon_state = "cafeteria"

/area/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR

/area/crew_quarters/theatre
	name = "Theatre"
	icon_state = "Theatre"
	sound_env = LARGE_SOFTFLOOR

/area/crew_quarters/safe_room
	name = "Safe Room"
	icon_state = "head_quarters"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/safe_room/thirddeck
	name = "Third Deck Safe Room"

/area/library
 	name = "Library"
 	icon_state = "library"
 	sound_env = LARGE_SOFTFLOOR

/area/chapel/main
	name = "Chapel"
	icon_state = "chapel"
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')
	sound_env = LARGE_ENCLOSED

/area/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/chapel/crematorium
	name = "Crematorium"
	icon_state = "chapel"
	sound_env = SMALL_ENCLOSED

/area/lawoffice
	name = "Internal Affairs"
	icon_state = "law"

/area/holocontrol
	name = "Holodeck Control"
	icon_state = "Holodeck"




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

/area/holodeck/source_burntest
	name = "Holodeck - Atmospheric Burn Test"

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

//Engineering

/area/engineering/
	name = "Engineering"
	icon_state = "engineering"
	ambience = list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg')

/area/engineering/atmos
 	name = "Atmospherics"
 	icon_state = "atmos"
 	sound_env = LARGE_ENCLOSED

/area/engineering/atmos/monitoring
	name = "Atmospherics Monitoring Room"
	icon_state = "atmos_monitoring"
	sound_env = STANDARD_STATION

/area/engineering/atmos/storage
	name = "Atmospherics Storage"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/atmos/aux
	name = "Auxiliary Atmospherics"
	icon_state = "atmos"
	sound_env = SMALL_ENCLOSED

/area/engineering/drone_fabrication
	name = "Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/auxpower
	name = "Auxiliary Power Storage"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED

/area/engineering/engine_room
	name = "Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED

/area/engineering/engine_sing_room
	name = "Singularity Room"
	icon_state = "engine"

/area/engineering/engine_airlock
	name = "Engine Room Airlock"
	icon_state = "engine"

/area/engineering/engine_monitoring
	name = "Engine Monitoring Room"
	icon_state = "engine_monitoring"

/area/engineering/engine_waste
	name = "Engine Waste Handling"
	icon_state = "engine_waste"

/area/engineering/engineering_monitoring
	name = "Engineering Monitoring Room"
	icon_state = "engine_monitoring"

/area/engineering/foyer
	name = "Engineering Foyer"
	icon_state = "engineering_foyer"

/area/engineering/storage
	name = "Engineering Storage"
	icon_state = "engineering_storage"

/area/engineering/hardstorage
	name = "Engineering Hard Storage"
	icon_state = "engineering_storage"

/area/engineering/break_room
	name = "Engineering Break Room"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR

/area/engineering/engine_eva
	name = "Engine EVA"
	icon_state = "engine_eva"

/area/engineering/locker_room
	name = "Engineering Locker Room"
	icon_state = "engineering_locker"

/area/engineering/workshop
	name = "Engineering Workshop"
	icon_state = "engineering_workshop"

/area/engineering/hallway
	name = "Engineering Hallway"
	icon_state = "engineering_workshop"



//Solars

/area/solar
	requires_power = 1
	always_unpowered = 1
	lighting_use_dynamic = 0
	base_turf = /turf/space


	starboard
		name = "Starboard Auxiliary Solar Array"
		icon_state = "panelsS"

	port
		name = "Port Auxiliary Solar Array"
		icon_state = "panelsP"

	auxport
		name = "Fore Port Solar Array"
		icon_state = "panelsA"

	auxstarboard
		name = "Fore Starboard Solar Array"
		icon_state = "panelsA"

	fore
		name = "Fore Solar Array"
		icon_state = "yellow"

	aft
		name = "Aft Solar Array"
		icon_state = "aft"


/area/maintenance/auxsolarport
	name = "Solar Maintenance - Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

/area/maintenance/auxsolarstarboard
	name = "Solar Maintenance - Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

/area/maintenance/starboardsolar
	name = "Solar Maintenance - Aft Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

/area/maintenance/portsolar
	name = "Solar Maintenance - Aft Port"
	icon_state = "SolarcontrolP"
	sound_env = SMALL_ENCLOSED

/area/maintenance/foresolar
	name = "Solar Maintenance - Fore"
	icon_state = "SolarcontrolA"
	sound_env = SMALL_ENCLOSED

/area/assembly/chargebay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/assembly/showroom
	name = "Robotics Showroom"
	icon_state = "showroom"

/area/assembly/robotics
	name = "Robotics Lab"
	icon_state = "robotics"

/area/assembly/assembly_line //Derelict Assembly Line
	name = "Assembly Line"
	icon_state = "ass_line"
	power_equip = 0
	power_light = 0
	power_environ = 0

//Teleporter

/area/teleporter
	name = "Teleporter"
	icon_state = "teleporter"

/area/gateway
	name = "Gateway"
	icon_state = "teleporter"

/area/AIsattele
	name = "AI Satellite Teleporter Room"
	icon_state = "teleporter"
	ambience = list('sound/ambience/ambimalf.ogg')

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

/area/medical/biostorage
	name = "Secondary Storage"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/equipstorage
	name = "Equipment Storage"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/reception
	name = "Medbay Reception"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/infirmreception
	name = "Infirmary Reception"
	icon_state = "medbay2"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/psych
	name = "Psych Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/mentalhealth
	name = "Mental Health"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/crew_quarters/medbreak
	name = "Break Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/patients_rooms
	name = "Patient's Rooms"
	icon_state = "patients"

/area/medical/ward
	name = "Recovery Ward"
	icon_state = "patients"

/area/medical/subacute
	name = "Sub-Acute Ward"
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

/area/medical/cmostore
	name = "Secure Storage"
	icon_state = "CMO"

/area/medical/robotics
	name = "Robotics"
	icon_state = "medresearch"

/area/medical/virology
	name = "Virology"
	icon_state = "virology"

/area/medical/virologyaccess
	name = "Virology Access"
	icon_state = "virology"

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')

/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/medical/surgery
	name = "Operating Theatre"
	icon_state = "surgery"

/area/medical/surgery1
	name = "Operating Theatre 1"
	icon_state = "surgery"

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

/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"

/area/medical/genetics_cloning
	name = "Cloning Lab"
	icon_state = "cloning"

/area/medical/sleeper
	name = "Emergency Treatment Centre"
	icon_state = "exam_room"

/area/medical/infirmary
	name = "Infirmary Hallway"
	icon_state = "medbay"

/area/medical/locker
	name = "Infirmary Locker Room"
	icon_state = "locker"

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

/area/security/equipment
	name = "Security Equipment"
	icon_state = "security"

/area/security/processing
	name = "Security Processing"
	icon_state = "security"

/area/security/evidence
	name = "Security Evidence Storage"
	icon_state = "security"

/area/security/wing
	name = "Security Wing"
	icon_state = "security"

/area/security/wing/prison_break()
	for(var/obj/structure/closet/secure_closet/brig/temp_closet in src)
		temp_closet.locked = 0
		temp_closet.icon_state = temp_closet.icon_closed
	for(var/obj/machinery/door_timer/temp_timer in src)
		temp_timer.releasetime = 1
	..()

/area/security/brig
	name = "Security - Brig"
	icon_state = "brig"

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

/area/security/prison
	name = "Security - Prison Wing"
	icon_state = "sec_prison"

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

/area/security/bo
	name = "Security - Brig Officer"
	icon_state = "Warden"

/area/security/armoury
	name = "Security - Armory"
	icon_state = "Warden"

/area/security/armourybridge
	name = "Bridge - Armory"
	icon_state = "Warden"

/area/security/armourybridgeaccess
	name = "bridge - Armory Access"
	icon_state = "Warden"

/area/security/detectives_office
	name = "Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/security/range
	name = "Security - Firing Range"
	icon_state = "firingrange"

/area/security/tactical
	name = "Security - Tactical Equipment"
	icon_state = "Tactical"

/area/security/Medbay
	name = "Security - MedBay"
	icon_state = "MedBayBrig"

/*
	New()
		..()

		spawn(10) //let objects set up first
			for(var/turf/turfToGrayscale in src)
				if(turfToGrayscale.icon)
					var/icon/newIcon = icon(turfToGrayscale.icon)
					newIcon.GrayScale()
					turfToGrayscale.icon = newIcon
				for(var/obj/objectToGrayscale in turfToGrayscale) //1 level deep, means tables, apcs, locker, etc, but not locker contents
					if(objectToGrayscale.icon)
						var/icon/newIcon = icon(objectToGrayscale.icon)
						newIcon.GrayScale()
						objectToGrayscale.icon = newIcon
*/

/area/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/security/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint1"

/area/security/checkpoint2
	name = "Security - Checkpoint"
	icon_state = "checkpoint1"

/area/security/checkpoint/supply
	name = "Security Post - Cargo Bay"
	icon_state = "checkpoint1"

/area/security/checkpoint/engineering
	name = "Security Post - Engineering"
	icon_state = "checkpoint1"

/area/security/checkpoint/medical
	name = "Security Post - Medbay"
	icon_state = "checkpoint1"

/area/security/checkpoint/science
	name = "Security Post - Science"
	icon_state = "checkpoint1"

/area/security/vacantoffice
	name = "Vacant Office"
	icon_state = "security"

/area/security/vacantoffice2
	name = "Vacant Office"
	icon_state = "security"

/area/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/quartermaster/deckofficer
	name = "Deck Officer"
	icon_state = "quart"

/area/quartermaster/office
	name = "Supply Office"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "Warehouse"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED

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

/area/quartermaster/expedition
	name = "Expedition Prep"
	icon_state = "mining"

/area/quartermaster/expedition/eva
	name = "Expedition EVA"
	icon_state = "mining"

/area/quartermaster/expedition/storage
	name = "Expedition Storage"
	icon_state = "mining"

/area/quartermaster/hangar
	name = "Hangar Deck"
	icon_state = "mining"
	sound_env = LARGE_ENCLOSED

/area/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

/area/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"

/area/hydroponics/storage
	name = "Hydroponics Storage"
	icon_state = "hydro"

/area/hydroponics/garden
	name = "Garden"
	icon_state = "garden"



//rnd (Research and Development)
/area/rnd/conference
	name = "Research Conference Room"
	icon_state = "research_conference"

/area/rnd/break_room
	name = "Research Break Room"
	icon_state = "research_break"

/area/rnd/research
	name = "Research and Development"
	icon_state = "research"

/area/rnd/docking
	name = "Research Dock"
	icon_state = "research_dock"

/area/rnd/lab
	name = "Research Lab"
	icon_state = "toxlab"

/area/rnd/development
	name = "Development Lab"
	icon_state = "toxlab"

/area/rnd/entry
	name = "Research and Development Access"
	icon_state = "decontamination"

/area/rnd/wing
	name = "Lab Wing"
	icon_state = "toxlab"

/area/rnd/rdoffice
	name = "Research Director's Office"
	icon_state = "head_quarters"

/area/rnd/supermatter
	name = "Supermatter Lab"
	icon_state = "toxlab"

/area/rnd/xenobiology
	name = "Xenobiology Lab"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/entry
	name = "Xenobiology Access"
	icon_state = "xeno_lab"

/area/rnd/xenobiology/xenoflora_storage
	name = "Xenoflora Storage"
	icon_state = "xeno_f_store"

/area/rnd/xenobiology/xenoflora
	name = "Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/rnd/storage
	name = "Toxins Storage"
	icon_state = "toxstorage"

/area/rnd/equipment
	name = "Equipment Storage"
	icon_state = "toxstorage"

/area/rnd/canister
	name = "Canister Storage"
	icon_state = "toxstorage"

/area/rnd/robotics
	name = "Robotics Lab"
	icon_state = "mechbay"

/area/rnd/test_area
	name = "Toxins Test Area"
	icon_state = "toxtest"

/area/rnd/mixing
	name = "Toxins Mixing Room"
	icon_state = "toxmix"

/area/rnd/phoron
	name = "Phoron Lab"
	icon_state = "toxmix"

/area/rnd/misc_lab
	name = "Miscellaneous Research"
	icon_state = "toxmisc"

/area/rnd/anom
	name = "Anomalous Materials"
	icon_state = "toxmisc"

/area/toxins/server
	name = "Server Room"
	icon_state = "server"

/area/rnd/locker
	name = "Research Locker Room"
	icon_state = "locker"

/area/rnd/checkpoint
	name = "Research Security Checkpoint"
	icon_state = "checkpoint1"

//Vacant Areas
/area/vacant
	name = "Vacant Area"
	icon_state = "construction"

/area/vacant/infirmary
	name = "Auxiliary Infirmary"
	icon_state = "medbay"

/area/vacant/monitoring
	name = "Auxiliary Monitoring Room"
	icon_state = "engine_monitoring"

/area/vacant/office
	name = "Vacant Office"
	icon_state = "security"

/area/vacant/mess
	name = "Officer's Mess"
	icon_state = "bar"

/area/vacant/armory
	name = "Marine Armory"
	icon_state = "Tactical"

/area/vacant/cannon
	name = "Main Gun"
	icon_state = "firingrange"

/area/vacant/cargo
	name = "Requisitions Office"
	icon_state = "quart"

/area/vacant/chapel
	name = "Unused Chapel"
	icon_state = "chapel"

/area/vacant/briefing
	name = "Briefing Room"
	icon_state = "conference"

/area/vacant/missile
	name = "Third Deck Port Missile Pod"
	icon_state = "firingrange"

/area/vacant/brig
	name = "Permanent Brig"
	icon_state = "brig"

/area/vacant/cabin
	name = "Vacant Cabins"
	icon_state = "crew_quarters"




//Storage

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/autolathe
	name = "Autolathe Storage"
	icon_state = "storage"

/area/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/storage/auxillary
	name = "Auxillary Storage"
	icon_state = "auxstorage"

/area/storage/auxillary/port
	name = "Port Auxillary Storage"
	icon_state = "auxstorage"

/area/storage/auxillary/starboard
	name = "Starboard Auxillary Storage"
	icon_state = "auxstorage"

/area/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/storage/secure
	name = "Secure Storage"
	icon_state = "storage"

/area/storage/emergency
	name = "Starboard Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency2
	name = "Port Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency3
	name = "Central Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

/area/storage/research
	name = "Research Storage"
	icon_state = "toxstorage"
	sound_env = SMALL_ENCLOSED

/area/storage/medical
	name = "Medical Storage"
	icon_state = "medbay4"
	sound_env = SMALL_ENCLOSED

/area/storage/cargo
	name = "Cargo Storage"
	icon_state = "quartstorage"
	sound_env = SMALL_ENCLOSED

/area/storage/expedition
	name = "Expedition Storage"
	icon_state = "storage"
	sound_env = SMALL_ENCLOSED





/area/storage/testroom
	requires_power = 0
	name = "Test Room"
	icon_state = "storage"

//DJSTATION

/area/djstation
	name = "Listening Post"
	icon_state = "LP"

/area/djstation/solars
	name = "Listening Post Solars"
	icon_state = "LPS"


/area/merchant_station
	name = "Merchant Station"
	icon_state = "LP"
//DERELICT

/area/derelict
	name = "Derelict Station"
	icon_state = "storage"

/area/derelict/hallway/primary
	name = "Derelict Primary Hallway"
	icon_state = "hallP"

/area/derelict/hallway/secondary
	name = "Derelict Secondary Hallway"
	icon_state = "hallS"

/area/derelict/arrival
	name = "Derelict Arrival Centre"
	icon_state = "yellow"

/area/derelict/storage/equipment
	name = "Derelict Equipment Storage"

/area/derelict/storage/storage_access
	name = "Derelict Storage Access"

/area/derelict/storage/engine_storage
	name = "Derelict Engine Storage"
	icon_state = "green"

/area/derelict/bridge
	name = "Derelict Control Room"
	icon_state = "bridge"

/area/derelict/secret
	name = "Derelict Secret Room"
	icon_state = "library"

/area/derelict/bridge/access
	name = "Derelict Control Room Access"
	icon_state = "auxstorage"

/area/derelict/bridge/ai_upload
	name = "Derelict Computer Core"
	icon_state = "ai"

/area/derelict/solar_control
	name = "Derelict Solar Control"
	icon_state = "engine"

/area/derelict/crew_quarters
	name = "Derelict Crew Quarters"
	icon_state = "fitness"

/area/derelict/medical
	name = "Derelict Medbay"
	icon_state = "medbay"

/area/derelict/medical/morgue
	name = "Derelict Morgue"
	icon_state = "morgue"

/area/derelict/medical/chapel
	name = "Derelict Chapel"
	icon_state = "chapel"

/area/derelict/teleporter
	name = "Derelict Teleporter"
	icon_state = "teleporter"

/area/derelict/eva
	name = "Derelict EVA Storage"
	icon_state = "eva"

/area/derelict/ship
	name = "Abandoned Ship"
	icon_state = "yellow"

/area/solar/derelict_starboard
	name = "Derelict Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/derelict_aft
	name = "Derelict Aft Solar Array"
	icon_state = "aft"

/area/derelict/singularity_engine
	name = "Derelict Singularity Engine"
	icon_state = "engine"

//HALF-BUILT STATION (REPLACES DERELICT IN BAYCODE, ABOVE IS LEFT FOR DOWNSTREAM)

/area/shuttle/constructionsite
	name = "Construction Site Shuttle"
	icon_state = "yellow"

/area/shuttle/constructionsite/station
	name = "Construction Site Shuttle"

/area/shuttle/constructionsite/site
	name = "Construction Site Shuttle"
	base_turf = /turf/simulated/floor/asteroid

/area/constructionsite
	name = "Construction Site"
	icon_state = "storage"

/area/constructionsite/storage
	name = "Construction Site Storage Area"

/area/constructionsite/science
	name = "Construction Site Research"

/area/constructionsite/bridge
	name = "Construction Site Bridge"
	icon_state = "bridge"

/area/constructionsite/maintenance
	name = "Construction Site Maintenance"
	icon_state = "yellow"

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

/area/solar/constructionsite
	name = "Construction Site Solars"
	icon_state = "aft"

/area/constructionsite/teleporter
	name = "Construction Site Teleporter"
	icon_state = "yellow"


//area/constructionsite
//	name = "Construction Site Shuttle"

//area/constructionsite
//	name = "Construction Site Shuttle"


//Construction

/area/construction
	name = "Engineering Construction Area"
	icon_state = "yellow"

/area/construction/supplyshuttle
	name = "Supply Shuttle"
	icon_state = "yellow"

/area/construction/quarters
	name = "Engineer's Quarters"
	icon_state = "yellow"

/area/construction/qmaint
	name = "Maintenance"
	icon_state = "yellow"

/area/construction/hallway
	name = "Hallway"
	icon_state = "yellow"

/area/construction/solars
	name = "Solar Panels"
	icon_state = "yellow"

/area/construction/solarscontrol
	name = "Solar Panel Control"
	icon_state = "yellow"

/area/construction/Storage
	name = "Construction Site Storage"
	icon_state = "yellow"

//AI

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/ai_monitored/storage/secure
	name = "Secure Storage"
	icon_state = "storage"

/area/ai_monitored/storage/emergency
	name = "Emergency Storage"
	icon_state = "storage"

/area/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"
	ambience = list('sound/ambience/ambimalf.ogg')
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_server_room
	name = "Messaging Server Room"
	icon_state = "ai_server"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')

/area/turret_protected/ai_cyborg_station
	name = "Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_outer_chamber
	name = "Outer AI Chamber"
	icon_state = "ai_chamber"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/ai_foyer
	name = "AI Chamber Foyer"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED

/area/turret_protected/aisat
	name = "AI Satellite"
	icon_state = "ai"

/area/turret_protected/aisat_interior
	name = "AI Satellite"
	icon_state = "ai"

/area/turret_protected/AIsatextFP
	name = "AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/AIsatextFS
	name = "AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/AIsatextAS
	name = "AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/AIsatextAP
	name = "AI Sat Ext"
	icon_state = "storage"
	luminosity = 1
	lighting_use_dynamic = 0

/area/turret_protected/NewAIMain
	name = "AI Main New"
	icon_state = "storage"



//Misc



/area/wreck/ai
	name = "AI Chamber"
	icon_state = "ai"

/area/wreck/main
	name = "Wreck"
	icon_state = "storage"

/area/wreck/engineering
	name = "Power Room"
	icon_state = "engine"

/area/wreck/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/generic
	name = "Unknown"
	icon_state = "storage"



// Telecommunications Satellite
/area/tcommsat/
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/entrance
	name = "Telecoms Teleporter"
	icon_state = "tcomsatentrance"

/area/tcommsat/chamber
	name = "Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/storage
	name = "Telecoms Storage"
	icon_state = "tcomsatstore"

/area/turret_protected/tcomsat
	name = "Telecoms Satellite"
	icon_state = "tcomsatlob"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/turret_protected/tcomfoyer
	name = "Telecoms Foyer"
	icon_state = "tcomsatentrance"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/turret_protected/tcomwest
	name = "Telecommunications Satellite West Wing"
	icon_state = "tcomsatwest"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/turret_protected/tcomeast
	name = "Telecommunications Satellite East Wing"
	icon_state = "tcomsateast"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/tcommsat/computer
	name = "Telecoms Control Room"
	icon_state = "tcomsatcomp"

/area/tcommsat/lounge
	name = "Telecommunications Satellite Lounge"
	icon_state = "tcomsatlounge"

/area/tcommsat/powercontrol
	name = "Telecommunications Power Control"
	icon_state = "tcomsatwest"


// Away Missions
/area/awaymission
	name = "Strange Location"
	icon_state = "away"

/area/awaymission/example
	name = "Strange Station"
	icon_state = "away"

/area/awaymission/wwmines
	name = "Wild West Mines"
	icon_state = "away1"
	luminosity = 1
	requires_power = 0

/area/awaymission/wwgov
	name = "Wild West Mansion"
	icon_state = "away2"
	luminosity = 1
	requires_power = 0

/area/awaymission/wwrefine
	name = "Wild West Refinery"
	icon_state = "away3"
	luminosity = 1
	requires_power = 0

/area/awaymission/wwvault
	name = "Wild West Vault"
	icon_state = "away3"
	luminosity = 0

/area/awaymission/wwvaultdoors
	name = "Wild West Vault Doors"  // this is to keep the vault area being entirely lit because of requires_power
	icon_state = "away2"
	requires_power = 0
	luminosity = 0

/area/awaymission/desert
	name = "Mars"
	icon_state = "away"

/area/awaymission/BMPship1
	name = "Aft Block"
	icon_state = "away1"

/area/awaymission/BMPship2
	name = "Midship Block"
	icon_state = "away2"

/area/awaymission/BMPship3
	name = "Fore Block"
	icon_state = "away3"

/area/awaymission/spacebattle
	name = "Space Battle"
	icon_state = "away"
	requires_power = 0

/area/awaymission/spacebattle/cruiser
	name = "Nanotrasen Cruiser"

/area/awaymission/spacebattle/syndicate1
	name = "Syndicate Assault Ship 1"

/area/awaymission/spacebattle/syndicate2
	name = "Syndicate Assault Ship 2"

/area/awaymission/spacebattle/syndicate3
	name = "Syndicate Assault Ship 3"

/area/awaymission/spacebattle/syndicate4
	name = "Syndicate War Sphere 1"

/area/awaymission/spacebattle/syndicate5
	name = "Syndicate War Sphere 2"

/area/awaymission/spacebattle/syndicate6
	name = "Syndicate War Sphere 3"

/area/awaymission/spacebattle/syndicate7
	name = "Syndicate Fighter"

/area/awaymission/spacebattle/secret
	name = "Hidden Chamber"

/area/awaymission/listeningpost
	name = "Listening Post"
	icon_state = "away"
	requires_power = 0

/area/awaymission/beach
	name = "Beach"
	icon_state = "null"
	luminosity = 1
	lighting_use_dynamic = 0
	requires_power = 0
	ambience = list()
	var/sound/mysound = null

	New()
		..()
		var/sound/S = new/sound()
		mysound = S
		S.file = 'sound/ambience/shore.ogg'
		S.repeat = 1
		S.wait = 0
		S.channel = 123
		S.volume = 100
		S.priority = 255
		S.status = SOUND_UPDATE
		process()

	Entered(atom/movable/Obj,atom/OldLoc)
		if(ismob(Obj))
			if(Obj:client)
				mysound.status = SOUND_UPDATE
				Obj << mysound
		return

	Exited(atom/movable/Obj)
		if(ismob(Obj))
			if(Obj:client)
				mysound.status = SOUND_PAUSED | SOUND_UPDATE
				Obj << mysound

	proc/process()
		set background = 1

		var/sound/S = null
		var/sound_delay = 0
		if(prob(25))
			S = sound(file=pick('sound/ambience/seag1.ogg','sound/ambience/seag2.ogg','sound/ambience/seag3.ogg'), volume=100)
			sound_delay = rand(0, 50)

		for(var/mob/living/carbon/human/H in src)
			if(H.s_tone > -55)
				H.s_tone--
				H.update_body()
			if(H.client)
				mysound.status = SOUND_UPDATE
				H << mysound
				if(S)
					spawn(sound_delay)
						H << S

		spawn(60) .()

/////////////////////////////////////////////////////////////////////
/*
 Lists of areas to be used with is_type_in_list.
 Used in gamemodes code at the moment. --rastaf0
*/

// CENTCOM
var/list/centcom_areas = list (
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


/area/beach
	name = "Keelin's private beach"
	icon_state = "null"
	luminosity = 1
	lighting_use_dynamic = 0
	requires_power = 0
	var/sound/mysound = null

	New()
		..()
		var/sound/S = new/sound()
		mysound = S
		S.file = 'sound/ambience/shore.ogg'
		S.repeat = 1
		S.wait = 0
		S.channel = 123
		S.volume = 100
		S.priority = 255
		S.status = SOUND_UPDATE
		process()

	Entered(atom/movable/Obj,atom/OldLoc)
		if(ismob(Obj))
			if(Obj:client)
				mysound.status = SOUND_UPDATE
				Obj << mysound
		return

	Exited(atom/movable/Obj)
		if(ismob(Obj))
			if(Obj:client)
				mysound.status = SOUND_PAUSED | SOUND_UPDATE
				Obj << mysound

	proc/process()
		set background = 1

		var/sound/S = null
		var/sound_delay = 0
		if(prob(25))
			S = sound(file=pick('sound/ambience/seag1.ogg','sound/ambience/seag2.ogg','sound/ambience/seag3.ogg'), volume=100)
			sound_delay = rand(0, 50)

		for(var/mob/living/carbon/human/H in src)
//			if(H.s_tone > -55)	//ugh...nice/novel idea but please no.
//				H.s_tone--
//				H.update_body()
			if(H.client)
				mysound.status = SOUND_UPDATE
				H << mysound
				if(S)
					spawn(sound_delay)
						H << S

		spawn(60) .()

