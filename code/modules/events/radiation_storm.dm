/datum/event/radiation_storm
	var/const/enterBelt		= 30
	var/const/radIntervall 	= 5	// Enough time between enter/leave belt for 10 hits, as per original implementation
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 135
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0

/datum/event/radiation_storm/announce()
	command_announcement.Announce("Высокий уровень радиации зарегестрирован р&#255;дом со станцией. Пожалуйста, пройдите в один из экранированных технических тоннелей", "Радиационна&#255; безопасность", new_sound = 'sound/AI/radiation.ogg')

/datum/event/radiation_storm/start()
	make_maint_all_access()

/datum/event/radiation_storm/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("Станци&#255; вошла в радиационный по&#255;с. Пожалуйста, оставайтесь в защищенном месте, пока мы не пройдем радиационный по&#255;с.", "Радиационна&#255; безопасность")
		radiate()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		radiate()

	else if(activeFor == leaveBelt)
		command_announcement.Announce("Станци&#255; прошла радиационный по&#255;с. Пожалуйста обратитесь в медотсек, если у вас возникли какие-либо необычные симптомы. Технические тоннели в скором времени будут заблокированы вновь.", "Радиационна&#255; безопасность")

/datum/event/radiation_storm/proc/radiate()
	var/radiation_level = rand(15, 35)
	for(var/area/A in all_areas)
		if(!(A.z in using_map.station_levels))
			continue
		if(A.flags & RAD_SHIELDED)
			continue
		for(var/turf/T in A)
			radiation_repository.irradiated_turfs[T] = radiation_level

	for(var/mob/living/carbon/C in living_mob_list_)
		var/area/A = get_area(C)
		if(!A)
			continue
		if(istype(C,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = C
			if(prob(5))
				if (prob(75))
					randmutb(H) // Applies bad mutation
					domutcheck(H,null,MUTCHK_FORCED)
				else
					randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)

/datum/event/radiation_storm/end()
	revoke_maint_all_access()

/datum/event/radiation_storm/syndicate/radiate()
	return
