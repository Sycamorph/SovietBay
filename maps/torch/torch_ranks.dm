/datum/map/torch
	branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/marine_corps,
		/datum/mil_branch/civilian
	)

	spawn_branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/marine_corps,
		/datum/mil_branch/civilian
	)



/*
 *  Branches
 *  ========
 */

/datum/mil_branch/expeditionary_corps
	name = "Expeditionary Corps"
	name_short = "SCGEC"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9_alt2,
		/datum/mil_rank/fleet/e9_alt3,
		/datum/mil_rank/fleet/e9_alt4,
		/datum/mil_rank/fleet/w1,
		/datum/mil_rank/fleet/w2,
		/datum/mil_rank/fleet/w3,
		/datum/mil_rank/fleet/w4,
		/datum/mil_rank/fleet/w5,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6,
		/datum/mil_rank/fleet/o7,
		/datum/mil_rank/fleet/o8,
		/datum/mil_rank/fleet/o9,
		/datum/mil_rank/fleet/o10,
		/datum/mil_rank/fleet/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6
	)

/datum/mil_branch/fleet
	name = "Fleet"
	name_short = "SCGF"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9_alt2,
		/datum/mil_rank/fleet/e9_alt3,
		/datum/mil_rank/fleet/e9_alt4,
		/datum/mil_rank/fleet/w1,
		/datum/mil_rank/fleet/w2,
		/datum/mil_rank/fleet/w3,
		/datum/mil_rank/fleet/w4,
		/datum/mil_rank/fleet/w5,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6,
		/datum/mil_rank/fleet/o7,
		/datum/mil_rank/fleet/o8,
		/datum/mil_rank/fleet/o9,
		/datum/mil_rank/fleet/o10,
		/datum/mil_rank/fleet/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6
	)

/datum/mil_branch/marine_corps
	name = "Marine Corps"
	name_short = "SCGMC"

	rank_types = list(
		/datum/mil_rank/marine/e1,
		/datum/mil_rank/marine/e2,
		/datum/mil_rank/marine/e3,
		/datum/mil_rank/marine/e4,
		/datum/mil_rank/marine/e5,
		/datum/mil_rank/marine/e6,
		/datum/mil_rank/marine/e7,
		/datum/mil_rank/marine/e8,
		/datum/mil_rank/marine/e8_alt,
		/datum/mil_rank/marine/e9,
		/datum/mil_rank/marine/e9_alt1,
		/datum/mil_rank/marine/e9_alt2,
		/datum/mil_rank/marine/w1,
		/datum/mil_rank/marine/w2,
		/datum/mil_rank/marine/w3,
		/datum/mil_rank/marine/w4,
		/datum/mil_rank/marine/w5,
		/datum/mil_rank/marine/o1,
		/datum/mil_rank/marine/o2,
		/datum/mil_rank/marine/o3,
		/datum/mil_rank/marine/o4,
		/datum/mil_rank/marine/o5,
		/datum/mil_rank/marine/o6,
		/datum/mil_rank/marine/o7,
		/datum/mil_rank/marine/o8,
		/datum/mil_rank/marine/o9,
		/datum/mil_rank/marine/o10
	)

	spawn_rank_types = list(
		/datum/mil_rank/marine/e2,
		/datum/mil_rank/marine/e3,
		/datum/mil_rank/marine/e4,
		/datum/mil_rank/marine/e5,
		/datum/mil_rank/marine/e6,
		/datum/mil_rank/marine/e7,
		/datum/mil_rank/marine/e8,
		/datum/mil_rank/marine/o1,
		/datum/mil_rank/marine/o2,
		/datum/mil_rank/marine/o3,
		/datum/mil_rank/marine/o4,
		/datum/mil_rank/marine/o5,
		/datum/mil_rank/marine/o6
	)

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "civ"

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)


/*
 *  Fleet
 *  =====
 */

/datum/mil_rank/fleet/e1
	name = "Crewman Recruit"
	name_short = "CR"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted

/datum/mil_rank/fleet/e2
	name = "Crewman Apprentice"
	name_short = "CA"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e2

/datum/mil_rank/fleet/e3
	name = "Crewman"
	name_short = "CN"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e3

/datum/mil_rank/fleet/e4
	name = "Petty Officer Third Class"
	name_short = "PO3"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e4

/datum/mil_rank/fleet/e5
	name = "Petty Officer Second Class"
	name_short = "PO2"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e5

/datum/mil_rank/fleet/e6
	name = "Petty Officer First Class"
	name_short = "PO1"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e6

/datum/mil_rank/fleet/e7
	name = "Chief Petty Officer"
	name_short = "CPO"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e7

/datum/mil_rank/fleet/e8
	name = "Senior Chief Petty Officer"
	name_short = "SCPO"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e8

/datum/mil_rank/fleet/e9
	name = "Master Chief Petty Officer"
	name_short = "MCPO"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/e9_alt1
	name = "Command Master Chief Petty Officer"
	name_short = "CMDCM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/e9_alt2
	name = "Fleet Master Chief Petty Officer"
	name_short = "FLTCM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/e9_alt3
	name = "Force Master Chief Petty Officer"
	name_short = "FORCM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/e9_alt4
	name = "Master Chief Petty Officer of the Fleet"
	name_short = "MCPOF"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/w1
	name = "Warrant Officer 1"
	name_short = "WO1"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/w2
	name = "Chief Warrant Officer 2"
	name_short = "CWO2"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/w3
	name = "Chief Warrant Officer 3"
	name_short = "CWO3"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/w4
	name = "Chief Warrant Officer 4"
	name_short = "CWO4"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/w5
	name = "Chief Warrant Officer 5"
	name_short = "CWO5"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/enlisted/e9

/datum/mil_rank/fleet/o1
	name = "Ensign"
	name_short = "ENS"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/officer

/datum/mil_rank/fleet/o2
	name = "Lieutenant (junior grade)"
	name_short = "LTJG"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/officer/o2

/datum/mil_rank/fleet/o3
	name = "Lieutenant"
	name_short = "LT"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/officer/o3

/datum/mil_rank/fleet/o4
	name = "Lieutenant Commander"
	name_short = "LCDR"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/officer/o4

/datum/mil_rank/fleet/o5
	name = "Commander"
	name_short = "CDR"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/officer/o5

/datum/mil_rank/fleet/o6
	name = "Captain"
	name_short = "CAPT"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/officer/o6

/datum/mil_rank/fleet/o7
	name = "Rear Admiral (lower half)"
	name_short = "RDML"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/flag

/datum/mil_rank/fleet/o8
	name = "Rear Admiral"
	name_short = "RADM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/flag/o8

/datum/mil_rank/fleet/o9
	name = "Vice Admiral"
	name_short = "VADM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/flag/o9

/datum/mil_rank/fleet/o10
	name = "Admiral"
	name_short = "ADM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/flag/o10

/datum/mil_rank/fleet/o10_alt
	name = "Fleet Admiral"
	name_short = "FADM"
	equip_epaullet = /obj/item/clothing/accessory/rank/fleet/flag/o10


/*
 *  Marines
 *  =======
 */

/datum/mil_rank/marine/e1
	name = "Private"
	name_short = "Pvt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/enlisted

/datum/mil_rank/marine/e2
	name = "Private First Class"
	name_short = "PFC"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e2

/datum/mil_rank/marine/e3
	name = "Lance Corporal"
	name_short = "LCpl"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e3

/datum/mil_rank/marine/e4
	name = "Corporal"
	name_short = "Cpl"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e4

/datum/mil_rank/marine/e5
	name = "Sergeant"
	name_short = "Sgt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e5

/datum/mil_rank/marine/e6
	name = "Staff Sergeant"
	name_short = "SSgt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e6

/datum/mil_rank/marine/e7
	name = "Gunnery Sergeant"
	name_short = "GySgt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e7

/datum/mil_rank/marine/e8
	name = "Master Sergeant"
	name_short = "MSgt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e8

/datum/mil_rank/marine/e8_alt
	name = "First Sergeant"
	name_short = "1st Sgt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e8alt

/datum/mil_rank/marine/e9
	name = "Master Gunnery Sergeant"
	name_short = "MGySgt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9

/datum/mil_rank/marine/e9_alt1
	name = "Sergeant Major"
	name_short = "SgtMaj"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/e9_alt2
	name = "Sergeant Major of the Marine Corps"
	name_short = "SMMC"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/w1
	name = "Warrant Officer 1"
	name_short = "WO"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/w2
	name = "Chief Warrant Officer 2"
	name_short = "CWO2"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/w3
	name = "Chief Warrant Officer 3"
	name_short = "CWO3"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/w4
	name = "Chief Warrant Officer 4"
	name_short = "CWO4"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/w5
	name = "Chief Warrant Officer 5"
	name_short = "CWO5"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/e9alt

/datum/mil_rank/marine/o1
	name = "Second Lieutenant"
	name_short = "2ndLt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/officer

/datum/mil_rank/marine/o2
	name = "First Lieutenant"
	name_short = "1stLt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/officer/o2

/datum/mil_rank/marine/o3
	name = "Captain"
	name_short = "Capt"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/officer/o3

/datum/mil_rank/marine/o4
	name = "Major"
	name_short = "Maj"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/officer/o4

/datum/mil_rank/marine/o5
	name = "Lieutenant Colonel"
	name_short = "LtCol"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/officer/o5

/datum/mil_rank/marine/o6
	name = "Colonel"
	name_short = "Col"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/officer/o6

/datum/mil_rank/marine/o7
	name = "Brigadier General"
	name_short = "BGen"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/flag

/datum/mil_rank/marine/o8
	name = "Major General"
	name_short = "MajGen"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/flag/o8

/datum/mil_rank/marine/o9
	name = "Lieutenant General"
	name_short = "LtGen"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/flag/o9

/datum/mil_rank/marine/o10
	name = "General"
	name_short = "Gen"
	equip_epaullet = /obj/item/clothing/accessory/rank/marine/flag/o10


/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"
	name_short = null

/datum/mil_rank/civ/nt
	name = "NanoTrasen employee"
	name_short = null

/datum/mil_rank/civ/contractor
	name = "Contractor"
	name_short = null

/datum/mil_rank/civ/synthetic
	name = "Synthetic"
	name_short = null

/*
 * Wearings spawn system
 * =====================
 */

/proc/equip_mil_items(var/mob/living/carbon/human/H)
	var/obj/item/newitem = new H.char_rank.equip_epaullet()
	H.equip_to_storage(newitem)
/*
	if(H.char_branch == /datum/mil_branch/fleet)
		if(job.department_flag & CIV && job.department_flag & !COM)
			H.equip_to_storage(/obj/item/clothing/under/utility/fleet)
			return
		if(job.department_flag & CIV && job.department_flag & COM)
			H.equip_to_storage(/obj/item/clothing/under/utility/fleet/command)
			return
		if(job.department_flag & SEC && job.department_flag & !COM)
			H.equip_to_storage(/obj/item/clothing/under/utility/fleet/security)
			return
		if(job.department_flag & SEC && job.department_flag & COM)
			H.equip_to_storage(/obj/item/clothing/under/utility/fleet/command)
			return
*/
	return newitem