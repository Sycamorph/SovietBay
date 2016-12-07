var/global/list/image/ghost_darkness_images = list() //this is a list of images for things ghosts should still be able to see when they toggle darkness
var/global/list/image/ghost_sightless_images = list() //this is a list of images for things ghosts should still be able to see even without ghost sight

/mob/observer/ghost
	name = "ghost"
	desc = "It's a g-g-g-g-ghooooost!" //jinkies!
	icon = 'icons/mob/mob.dmi'
	icon_state = "ghost"
	appearance_flags = KEEP_TOGETHER
	canmove = 0
	blinded = 0
	anchored = 1	//  don't get pushed around
	universal_speak = 1
	var/is_manifest = FALSE
	var/next_visibility_toggle = 0
	var/can_reenter_corpse
	var/datum/hud/living/carbon/hud = null // hud
	var/bootime = 0
	var/started_as_observer //This variable is set to 1 when you enter the game as an observer.
							//If you died in the game and are a ghost - this will remain as null.
							//Note that this is not a reliable way to determine if admins started as observers, since they change mobs a lot.
	var/has_enabled_antagHUD = 0
	var/medHUD = 0
	var/antagHUD = 0
	var/atom/movable/following = null
	var/admin_ghosted = 0
	var/anonsay = 0
	var/ghostvision = 1 //is the ghost able to see things humans can't?
	var/seedarkness = 1

	var/obj/item/device/multitool/ghost_multitool
	incorporeal_move = 1

	var/list/hud_images // A list of hud images

/mob/observer/ghost/New(mob/body)
	see_in_dark = 100
	verbs += /mob/proc/toggle_antag_pool

	var/turf/T
	if(ismob(body))
		T = get_turf(body)               //Where is the body located?
		attack_logs_ = body.attack_logs_ //preserve our attack logs by copying them to our ghost

		set_appearance(body)
		if(body.mind && body.mind.name)
			name = body.mind.name
		else
			if(body.real_name)
				name = body.real_name
			else
				if(gender == MALE)
					name = capitalize(pick(first_names_male)) + " " + capitalize(pick(last_names))
				else
					name = capitalize(pick(first_names_female)) + " " + capitalize(pick(last_names))

		mind = body.mind	//we don't transfer the mind but we keep a reference to it.
	else
		spawn(10) // wait for the observer mob to receive the client's key
			mind = new /datum/mind(key)
			mind.current = src
	if(!T)	T = pick(latejoin | latejoin_cryo | latejoin_gateway)			//Safety in case we cannot find the body's position
	forceMove(T)

	if(!name)							//To prevent nameless ghosts
		name = capitalize(pick(first_names_male)) + " " + capitalize(pick(last_names))
	real_name = name

	ghost_multitool = new(src)
	..()

/mob/observer/ghost/Destroy()
	stop_following()
	qdel(ghost_multitool)
	ghost_multitool = null
	if(hud_images)
		for(var/image/I in hud_images)
			show_hud_icon(I.icon_state, FALSE)
		hud_images = null
	return ..()

/mob/observer/ghost/Topic(href, href_list)
	if (href_list["track"])
		if(istype(href_list["track"],/mob))
			var/mob/target = locate(href_list["track"]) in mob_list
			if(target)
				ManualFollow(target)
		else
			var/atom/target = locate(href_list["track"])
			if(istype(target))
				ManualFollow(target)
	else if(href_list["antag_hud"])
		toggle_antagHUD()
	else if(href_list["speakerinfo"])
		var/mob/M = locate(href_list["speakerinfo"])
		if(!ismob(M))
			usr << "This can only be used on instances of type /mob"
			return

		var/location_description = ""
		var/special_role_description = ""
		var/health_description = ""
		var/gender_description = ""
		var/turf/T = get_turf(M)

		//Location
		if(isturf(T))
			if(isarea(T.loc))
				location_description = "([M.loc == T ? "at coordinates " : "in [M.loc] at coordinates "] [T.x], [T.y], [T.z] in area <b>[T.loc]</b>)"
			else
				location_description = "([M.loc == T ? "at coordinates " : "in [M.loc] at coordinates "] [T.x], [T.y], [T.z])"

		//Job + antagonist
		if(M.mind)
			if(client.holder || (config.antag_hud_allowed && (!config.antag_hud_restricted || (config.antag_hud_restricted && has_enabled_antagHUD == 1))))
				special_role_description = "Role: <b>[M.mind.assigned_role]</b>; Antagonist: <font color='red'><b>[M.mind.special_role]</b></font>; Has been rev: [(M.mind.has_been_rev)?"Yes":"No"]"
			else
				special_role_description = "Role: <b>[M.mind.assigned_role]</b>; Antagonist: <font color='red'><b>enable <a href='?src=\ref[usr];antag_hud=1'>antagHUD</a> to watch special roles.</b></font>"
		else
			special_role_description = "Role: <i>Mind datum missing</i> Antagonist: <i>Mind datum missing</i>; Has been rev: <i>Mind datum missing</i>;"

		//Health
		if(isliving(M))
			var/mob/living/L = M
			var/status
			switch (M.stat)
				if (0) status = "Alive"
				if (1) status = "<font color='orange'><b>Unconscious</b></font>"
				if (2) status = "<font color='red'><b>Dead</b></font>"
			health_description = "Status = [status]"
			health_description += "<BR>Oxy: [L.getOxyLoss()] - Tox: [L.getToxLoss()] - Fire: [L.getFireLoss()] - Brute: [L.getBruteLoss()] - Clone: [L.getCloneLoss()] - Brain: [L.getBrainLoss()]"
		else
			health_description = "This mob type has no health to speak of."

		//Gener
		switch(M.gender)
			if(MALE,FEMALE)	gender_description = "[M.gender]"
			else			gender_description = "<font color='red'><b>[M.gender]</b></font>"

		src << "<b>Info about [M.name]:</b> "
		src << "Mob type = [M.type]; Gender = [gender_description] Damage = [health_description]"
		src << "Name = <b>[M.name]</b>; Real_name = [M.real_name]; Mind_name = [M.mind?"[M.mind.name]":""]; Key = <b>[M.key]</b>;"
		src << "Location = [location_description];"
		src << "[special_role_description]"
		if(client.holder)
			src << "(<a href='?src=\ref[usr];priv_msg=\ref[M]'>PM</a>) (<A HREF='?src=\ref[src];adminplayeropts=\ref[M]'>PP</A>) (<A HREF='?_src_=vars;Vars=\ref[M]'>VV</A>) (<A HREF='?src=\ref[src];subtlemessage=\ref[M]'>SM</A>) (<A HREF='?src=\ref[src];adminplayerobservejump=\ref[M]'>JMP</A>) (<A HREF='?src=\ref[src];secretsadmin=check_antagonist'>CA</A>)"


/mob/observer/ghost/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/weapon/book/tome))
		var/mob/observer/ghost/M = src
		M.manifest()

/*
Transfer_mind is there to check if mob is being deleted/not going to have a body.
Works together with spawning an observer, noted above.
*/

/mob/observer/ghost/Life()
	..()
	if(!loc) return
	if(!client) return 0

	handle_hud_glasses()

	if(antagHUD)
		var/list/target_list = list()
		for(var/mob/living/target in oview(src, 14))
			if(target.mind && target.mind.special_role)
				target_list += target
		if(target_list.len)
			assess_targets(target_list, src)
	if(medHUD)
		process_medHUD(src)


/mob/observer/ghost/proc/process_medHUD(var/mob/M)
	var/client/C = M.client
	for(var/mob/living/carbon/human/patient in oview(M, 14))
		C.images += patient.hud_list[HEALTH_HUD]
		C.images += patient.hud_list[STATUS_HUD_OOC]

/mob/observer/ghost/proc/assess_targets(list/target_list, mob/observer/ghost/U)
	var/client/C = U.client
	for(var/mob/living/carbon/human/target in target_list)
		C.images += target.hud_list[SPECIALROLE_HUD]
	for(var/mob/living/silicon/target in target_list)
		C.images += target.hud_list[SPECIALROLE_HUD]
	return 1

/mob/proc/ghostize(var/can_reenter_corpse = CORPSE_CAN_REENTER)
	// Are we the body of an aghosted admin? If so, don't make a ghost.
	if(teleop && istype(teleop, /mob/observer/ghost))
		var/mob/observer/ghost/G = teleop
		if(G.admin_ghosted)
			return
	if(key)
		var/mob/observer/ghost/ghost = new(src)	//Transfer safety to observer spawning proc.
		ghost.can_reenter_corpse = can_reenter_corpse
		ghost.timeofdeath = src.stat == DEAD ? src.timeofdeath : world.time
		ghost.key = key
		if(ghost.client && !ghost.client.holder && !config.antag_hud_allowed)		// For new ghosts we remove the verb from even showing up if it's not allowed.
			ghost.verbs -= /mob/observer/ghost/verb/toggle_antagHUD	// Poor guys, don't know what they are missing!
		return ghost

/*
This is the proc mobs get to turn into a ghost. Forked from ghostize due to compatibility issues.
*/
/mob/living/verb/ghost()
	set category = "OOC"
	set name = "Ghost"
	set desc = "Relinquish your life and enter the land of the dead."

	if(stat == DEAD)
		announce_ghost_joinleave(ghostize(1))
	else
		var/response
		if(src.client && src.client.holder)
			response = alert(src, "You have the ability to Admin-Ghost. The regular Ghost verb will announce your presence to dead chat. Both variants will allow you to return to your body using 'aghost'.\n\nWhat do you wish to do?", "Are you sure you want to ghost?", "Ghost", "Admin Ghost", "Stay in body")
			if(response == "Admin Ghost")
				if(!src.client)
					return
				src.client.admin_ghost()
		else if(config.respawn_delay)
			response = alert(src, "Are you -sure- you want to ghost?\n(You are alive. If you ghost, you won't be able to play this round for another [config.respawn_delay] minute\s! You can't change your mind so choose wisely!)", "Are you sure you want to ghost?", "Ghost", "Stay in body")
		else
			response = alert(src, "Are you -sure- you want to ghost?\n(You are alive. If you ghost, you won't be able to return to this body! You can't change your mind so choose wisely!)", "Are you sure you want to ghost?", "Ghost", "Stay in body")
		if(response != "Ghost")
			return
		resting = 1
		var/turf/location = get_turf(src)
		message_admins("[key_name_admin(usr)] has ghosted. (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[location.x];Y=[location.y];Z=[location.z]'>JMP</a>)")
		log_game("[key_name_admin(usr)] has ghosted.")
		var/mob/observer/ghost/ghost = ghostize(0)	//0 parameter is so we can never re-enter our body, "Charlie, you can never come baaaack~" :3
		ghost.timeofdeath = world.time // Because the living mob won't have a time of death and we want the respawn timer to work properly.
		announce_ghost_joinleave(ghost)

/mob/observer/ghost/can_use_hands()	return 0
/mob/observer/ghost/is_active()		return 0

/mob/observer/ghost/Stat()
	. = ..()
	if(statpanel("Status"))
		if(evacuation_controller)
			var/eta_status = evacuation_controller.get_status_panel_eta()
			if(eta_status)
				stat(null, eta_status)

/mob/observer/ghost/verb/reenter_corpse()
	set category = "Ghost"
	set name = "Re-enter Corpse"
	if(!client)	return
	if(!(mind && mind.current && can_reenter_corpse))
		to_chat(src, "<span class='warning'>You have no body.</span>")
		return
	if(mind.current.key && copytext(mind.current.key,1,2)!="@")	//makes sure we don't accidentally kick any clients
		to_chat(src, "<span class='warning'>Another consciousness is in your body... it is resisting you.</span>")
		return
	if(mind.current.ajourn && mind.current.stat != DEAD) //check if the corpse is astral-journeying (it's client ghosted using a cultist rune).
		var/found_rune
		for(var/obj/effect/rune/R in mind.current.loc)   //whilst corpse is alive, we can only reenter the body if it's on the rune
			if(R && R.word1 == cultwords["hell"] && R.word2 == cultwords["travel"] && R.word3 == cultwords["self"]) // Found an astral journey rune.
				found_rune = 1
				break
		if(!found_rune)
			to_chat(src, "<span class='warning'>The astral cord that ties your body and your spirit has been severed. You are likely to wander the realm beyond until your body is finally dead and thus reunited with you.</span>")
			return
	stop_following()
	mind.current.ajourn=0
	mind.current.key = key
	mind.current.teleop = null
	if(!admin_ghosted)
		announce_ghost_joinleave(mind, 0, "They now occupy their body again.")
	return 1

/mob/observer/ghost/verb/toggle_medHUD()
	set category = "Ghost"
	set name = "Toggle MedicHUD"
	set desc = "Toggles Medical HUD allowing you to see how everyone is doing"
	if(!client)
		return
	if(medHUD)
		medHUD = 0
		to_chat(src, "<span class='notice'>Medical HUD Disabled</span>")
	else
		medHUD = 1
		to_chat(src, "<span class='notice'>Medical HUD Enabled</span>")
/mob/observer/ghost/verb/toggle_antagHUD()
	set category = "Ghost"
	set name = "Toggle AntagHUD"
	set desc = "Toggles AntagHUD allowing you to see who is the antagonist"

	if(!client)
		return
	var/mentor = is_mentor(usr.client)
	if(!config.antag_hud_allowed && (!client.holder || mentor))
		to_chat(src, "<span class='warning'>Admins have disabled this for this round.</span>")
		return
	var/mob/observer/ghost/M = src
	if(jobban_isbanned(M, "AntagHUD"))
		to_chat(src, "<span class='danger'>You have been banned from using this feature</span>")
		return
	if(config.antag_hud_restricted && !M.has_enabled_antagHUD && (!client.holder || mentor))
		var/response = alert(src, "If you turn this on, you will not be able to take any part in the round.","Are you sure you want to turn this feature on?","Yes","No")
		if(response == "No") return
		M.can_reenter_corpse = 0
	if(!M.has_enabled_antagHUD && (!client.holder || mentor))
		M.has_enabled_antagHUD = 1
	if(M.antagHUD)
		M.antagHUD = 0
		to_chat(src, "<span class='notice'>AntagHUD Disabled</span>")
	else
		M.antagHUD = 1
		to_chat(src, "<span class='notice'>AntagHUD Enabled</span>")
/mob/observer/ghost/verb/dead_tele(A in area_repository.get_areas_by_z_level())
	set category = "Ghost"
	set name = "Teleport"
	set desc= "Teleport to a location"

	var/area/thearea = area_repository.get_areas_by_z_level()[A]
	if(!thearea)
		to_chat(src, "No area available.")
		return

	var/list/area_turfs = get_area_turfs(thearea, shall_check_if_holy() ? list(/proc/is_holy_turf) : list())
	if(!area_turfs.len)
		to_chat(src, "<span class='warning'>This area has been entirely made into sacred grounds, you cannot enter it while you are in this plane of existence!</span>")
		return

	ghost_to_turf(pick(area_turfs))

/mob/observer/ghost/verb/dead_tele_coord(tx as num, ty as num, tz as num)
	set category = "Ghost"
	set name = "Teleport to Coordinate"
	set desc= "Teleport to a coordinate"

	var/turf/T = locate(tx, ty, tz)
	if(T)
		ghost_to_turf(T)
	else
		to_chat(src, "<span class='warning'>Invalid coordinates.</span>")
/mob/observer/ghost/verb/follow(input in getmobs())
	set category = "Ghost"
	set name = "Follow"
	set desc = "Follow and haunt a mob."

	var/target = getmobs()[input]
	if(!target) return
	ManualFollow(target)

/mob/observer/ghost/proc/ghost_to_turf(var/turf/target_turf)
	if(check_is_holy_turf(target_turf))
		to_chat(src, "<span class='warning'>The target location is holy grounds!</span>")
		return
	stop_following()
	forceMove(target_turf)

// This is the ghost's follow verb with an argument
/mob/observer/ghost/proc/ManualFollow(var/atom/movable/target)
	if(!target || target == following || target == src)
		return

	stop_following()
	following = target
	moved_event.register(following, src, /atom/movable/proc/move_to_turf)
	dir_set_event.register(following, src, /atom/proc/recursive_dir_set)
	destroyed_event.register(following, src, /mob/observer/ghost/proc/stop_following)

	to_chat(src, "<span class='notice'>Now following \the [following].</span>")
	move_to_turf(following, loc, following.loc)

/mob/observer/ghost/proc/stop_following()
	if(following)
		to_chat(src, "<span class='notice'>No longer following \the [following]</span>")
		moved_event.unregister(following, src)
		dir_set_event.unregister(following, src)
		destroyed_event.unregister(following, src)
		following = null

/mob/observer/ghost/move_to_turf(var/atom/movable/am, var/old_loc, var/new_loc)
	var/turf/T = get_turf(new_loc)
	if(check_is_holy_turf(T))
		to_chat(src, "<span class='warning'>You cannot follow something standing on holy grounds!</span>")
		return
	..()

/mob/observer/ghost/memory()
	set hidden = 1
	to_chat(src, "<span class='warning'>You are dead! You have no mind to store memory!</span>")
/mob/observer/ghost/add_memory()
	set hidden = 1
	to_chat(src, "<span class='warning'>You are dead! You have no mind to store memory!</span>")
/mob/observer/ghost/Post_Incorpmove()
	stop_following()

/mob/observer/ghost/verb/analyze_air()
	set name = "Analyze Air"
	set category = "Ghost"

	var/turf/t = get_turf(src)
	if(t)
		print_atmos_analysis(src, atmosanalyzer_scan(t))

/mob/observer/ghost/verb/become_mouse()
	set name = "Become mouse"
	set category = "Ghost"

	if(config.disable_player_mice)
		to_chat(src, "<span class='warning'>Spawning as a mouse is currently disabled.</span>")
		return

	if(!MayRespawn(1, ANIMAL_SPAWN_DELAY))
		return

	var/turf/T = get_turf(src)
	if(!T || (T.z in using_map.admin_levels))
		to_chat(src, "<span class='warning'>You may not spawn as a mouse on this Z-level.</span>")
		return

	var/response = alert(src, "Are you -sure- you want to become a mouse?","Are you sure you want to squeek?","Squeek!","Nope!")
	if(response != "Squeek!") return  //Hit the wrong key...again.


	//find a viable mouse candidate
	var/mob/living/simple_animal/mouse/host
	var/obj/machinery/atmospherics/unary/vent_pump/vent_found
	var/list/found_vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/v in machines)
		if(!v.welded && v.z == T.z)
			found_vents.Add(v)
	if(found_vents.len)
		vent_found = pick(found_vents)
		host = new /mob/living/simple_animal/mouse(vent_found.loc)
	else
		to_chat(src, "<span class='warning'>Unable to find any unwelded vents to spawn mice at.</span>")
	if(host)
		if(config.uneducated_mice)
			host.universal_understand = 0
		announce_ghost_joinleave(src, 0, "They are now a mouse.")
		host.ckey = src.ckey
		host.status_flags |= NO_ANTAG
		to_chat(host, "<span class='info'>You are now a mouse. Try to avoid interaction with players, and do not give hints away that you are more than a simple rodent.</span>")
/mob/observer/ghost/verb/view_manfiest()
	set name = "Show Crew Manifest"
	set category = "Ghost"

	var/dat
	dat += "<h4>Crew Manifest</h4>"
	dat += data_core.get_manifest()

	src << browse(dat, "window=manifest;size=370x420;can_close=1")

//This is called when a ghost is drag clicked to something.
/mob/observer/ghost/MouseDrop(atom/over)
	if(!usr || !over) return
	if(isghost(usr) && usr.client && isliving(over))
		var/mob/living/M = over
		// If they an admin, see if control can be resolved.
		if(usr.client.holder && usr.client.holder.cmd_ghost_drag(src,M))
			return
		// Otherwise, see if we can possess the target.
		if(usr == src && try_possession(M))
			return
	if(istype(over, /obj/machinery/drone_fabricator))
		if(try_drone_spawn(src, over))
			return

	return ..()

/mob/observer/ghost/proc/try_possession(var/mob/living/M)
	if(!config.ghosts_can_possess_animals)
		to_chat(src, "<span class='warning'>Ghosts are not permitted to possess animals.</span>")
		return 0
	if(!M.can_be_possessed_by(src))
		return 0
	return M.do_possession(src)

//Used for drawing on walls with blood puddles as a spooky ghost.
/mob/observer/ghost/verb/bloody_doodle()

	set category = "Ghost"
	set name = "Write in blood"
	set desc = "If the round is sufficiently spooky, write a short message in blood on the floor or a wall. Remember, no IC in OOC or OOC in IC."

	if(!(config.cult_ghostwriter))
		to_chat(src, "<span class='warning'>That verb is not currently permitted.</span>")
		return

	if (!src.stat)
		return

	if (usr != src)
		return 0 //something is terribly wrong

	if(!round_is_spooky())
		to_chat(src, "<span class='warning'>The veil is not thin enough for you to do that.</span>")
		return

	var/list/choices = list()
	for(var/obj/effect/decal/cleanable/blood/B in view(1,src))
		if(B.amount > 0)
			choices += B

	if(!choices.len)
		to_chat(src, "<span class = 'warning'>There is no blood to use nearby.</span>")
		return

	var/obj/effect/decal/cleanable/blood/choice = input(src,"What blood would you like to use?") in null|choices

	var/direction = input(src,"Which way?","Tile selection") as anything in list("Here","North","South","East","West")
	var/turf/simulated/T = src.loc
	if (direction != "Here")
		T = get_step(T,text2dir(direction))

	if (!istype(T))
		to_chat(src, "<span class='warning'>You cannot doodle there.</span>")
		return

	if(!choice || choice.amount == 0 || !(src.Adjacent(choice)))
		return

	var/doodle_color = (choice.basecolor) ? choice.basecolor : "#A10808"

	var/num_doodles = 0
	for (var/obj/effect/decal/cleanable/blood/writing/W in T)
		num_doodles++
	if (num_doodles > 4)
		to_chat(src, "<span class='warning'>There is no space to write on!</span>")
		return

	var/max_length = 50

	var/message = sanitize(input("Write a message. It cannot be longer than [max_length] characters.","Blood writing", ""))

	if (message)

		if (length(message) > max_length)
			message += "-"
			to_chat(src, "<span class='warning'>You ran out of blood to write with!</span>")
		var/obj/effect/decal/cleanable/blood/writing/W = new(T)
		W.basecolor = doodle_color
		W.update_icon()
		W.message = message
		W.add_hiddenprint(src)
		W.visible_message("<span class='warning'>Invisible fingers crudely paint something in blood on [T]...</span>")

/mob/observer/ghost/pointed(atom/A as mob|obj|turf in view())
	if(!..())
		return 0
	usr.visible_message("<span class='deadsay'><b>[src]</b> points to [A]</span>")
	return 1

/mob/observer/ghost/proc/manifest()
	if(!is_manifest)
		is_manifest = TRUE
		verbs += /mob/observer/ghost/proc/toggle_visibility

	if(src.invisibility > SEE_INVISIBLE_LIVING)
		toggle_visibility(1)
		return TRUE
	else
		return FALSE

/mob/observer/ghost/proc/show_hud_icon(var/icon_state, var/make_visible)
	if(!hud_images)
		hud_images = list()
	var/image/hud_image = hud_images[icon_state]
	if(!hud_image)
		hud_image = image('icons/mob/mob.dmi', loc = src, icon_state = icon_state)
		hud_images[icon_state] = hud_image

	if(make_visible)
		add_client_image(hud_image)
	else
		remove_client_image(hud_image)

/mob/observer/ghost/proc/toggle_visibility()
	set category = "Ghost"
	set name = "Toggle Visibility"
	set desc = "Allows you to turn (in)visible (almost) at will."

	if(invisibility && !(args.len && args[1]) && world.time < next_visibility_toggle)
		to_chat(src, "You must gather strength before you can turn visible again...")
		return

	if(invisibility == 0)
		next_visibility_toggle = world.time + 1 MINUTE
		visible_message("<span class='emote'>It fades from sight...</span>", "<span class='info'>You are now invisible.</span>")
		invisibility = INVISIBILITY_OBSERVER
		show_hud_icon("cult", FALSE)
	else
		to_chat(src, "<span class='info'>You are now visible!</span>")
		invisibility = 0
		show_hud_icon("cult", TRUE) // Give the ghost a cult icon which should be visible only to itself

/mob/observer/ghost/verb/toggle_anonsay()
	set category = "Ghost"
	set name = "Toggle Anonymous Chat"
	set desc = "Toggles showing your key in dead chat."

	src.anonsay = !src.anonsay
	if(anonsay)
		to_chat(src, "<span class='info'>Your key won't be shown when you speak in dead chat.</span>")
	else
		to_chat(src, "<span class='info'>Your key will be publicly visible again.</span>")
/mob/observer/ghost/canface()
	return 1

/mob/proc/can_admin_interact()
    return 0

/mob/observer/ghost/can_admin_interact()
	return check_rights(R_ADMIN, 0, src)

/mob/observer/ghost/verb/toggle_ghostsee()
	set name = "Toggle Ghost Vision"
	set desc = "Toggles your ability to see things only ghosts can see, like other ghosts"
	set category = "Ghost"
	ghostvision = !(ghostvision)
	updateghostsight()
	to_chat(src, "You [(ghostvision?"now":"no longer")] have ghost vision.")
/mob/observer/ghost/verb/toggle_darkness()
	set name = "Toggle Darkness"
	set category = "Ghost"
	seedarkness = !(seedarkness)
	updateghostsight()

/mob/observer/ghost/verb/controll_hostile()
	set name = "Take Hostile Control"
	set desc = "Allowing you to take control of the mob"
	set category = "Ghost"

	if(config.antag_hud_restricted && has_enabled_antagHUD == 1)
		src << "<span class='warning'>antagHUD restrictions prevent you from take controll mob.</span>"
		return

	var/timedifference = world.time - timeofdeath
	if(timeofdeath && timedifference < 3 MINUTES)
		var/timedifference_text = time2text(3 MINUTES - timedifference,"mm:ss")
		src << "<span class='warning'>You must have been dead for 3 minutes to take controll. You have [timedifference_text] left.</span>"
		return

	var/list/control_mobs = list()
	for(var/mob/living/simple_animal/hostile/M in world)
		if(!M.stat && M.controllable && !M.client)
			control_mobs += M

	var/mob/living/simple_animal/hostile/target = null
	if(control_mobs.len)
		target = input("Please, select a hostile!", "Select a hostile!",) as mob in control_mobs
	else
		src << "<span class='warning'>Controllable hostile not found.</span>"

	if(target)
		var/mob/oldmob = src
		target.ckey = src.ckey
		qdel(oldmob)

/mob/observer/ghost/proc/updateghostsight()
	if (!seedarkness)
		set_see_invisible(SEE_INVISIBLE_NOLIGHTING)
	else
		set_see_invisible(ghostvision ? SEE_INVISIBLE_OBSERVER : SEE_INVISIBLE_LIVING)
	updateghostimages()

/mob/observer/ghost/proc/updateghostimages()
	if (!client)
		return
	client.images -= ghost_sightless_images
	client.images -= ghost_darkness_images
	if(!seedarkness)
		client.images |= ghost_sightless_images
		if(ghostvision)
			client.images |= ghost_darkness_images
	else if(seedarkness && !ghostvision)
		client.images |= ghost_sightless_images
	client.images -= ghost_image //remove ourself

/mob/observer/ghost/MayRespawn(var/feedback = 0, var/respawn_time = 0)
	if(!client)
		return 0
	if(mind && mind.current && mind.current.stat != DEAD && can_reenter_corpse == CORPSE_CAN_REENTER)
		if(feedback)
			to_chat(src, "<span class='warning'>Your non-dead body prevents you from respawning.</span>")
		return 0
	if(config.antag_hud_restricted && has_enabled_antagHUD == 1)
		if(feedback)
			to_chat(src, "<span class='warning'>antagHUD restrictions prevent you from respawning.</span>")
		return 0

	var/timedifference = world.time - timeofdeath
	if(respawn_time && timeofdeath && timedifference < respawn_time MINUTES)
		var/timedifference_text = time2text(respawn_time MINUTES - timedifference,"mm:ss")
		to_chat(src, "<span class='warning'>You must have been dead for [respawn_time] minute\s to respawn. You have [timedifference_text] left.</span>")
		return 0

	return 1

/proc/isghostmind(var/datum/mind/player)
	return player && !isnewplayer(player.current) && (!player.current || isghost(player.current) || (isliving(player.current) && player.current.stat == DEAD) || !player.current.client)

/mob/proc/check_is_holy_turf(var/turf/T)
	return 0

/mob/observer/ghost/check_is_holy_turf(var/turf/T)
	if(shall_check_if_holy() && is_holy_turf(T))
		return TRUE

/mob/observer/ghost/proc/shall_check_if_holy()
	if(invisibility >= INVISIBILITY_OBSERVER)
		return FALSE
	if(check_rights(R_ADMIN|R_FUN, 0, src))
		return FALSE
	return TRUE

/mob/observer/ghost/proc/set_appearance(var/mob/target)
	var/pre_alpha = alpha
	var/pre_plane = plane
	var/pre_layer = layer
	var/pre_invis = invisibility

	appearance = target
	appearance_flags |= initial(appearance_flags)
	alpha = pre_alpha
	plane = pre_plane
	layer = pre_layer
	invisibility = pre_invis

/mob/observer/ghost/verb/respawn()
	set name = "Respawn"
	set category = "OOC"

	if (!(config.abandon_allowed))
		to_chat(usr, "<span class='notice'>Respawn is disabled.</span>")
		return
	if (!(ticker && ticker.mode))
		to_chat(usr, "<span class='notice'><B>You may not attempt to respawn yet.</B></span>")
		return
	if (ticker.mode && ticker.mode.deny_respawn)
		to_chat(usr, "<span class='notice'>Respawn is disabled for this roundtype.</span>")
		return
	else if(!MayRespawn(1, config.respawn_delay))
		return

	to_chat(usr, "You can respawn now, enjoy your new life!")
	to_chat(usr, "<span class='notice'><B>Make sure to play a different character, and please roleplay correctly!</B></span>")
	announce_ghost_joinleave(client, 0)

	var/mob/new_player/M = new /mob/new_player()
	M.key = key
	log_and_message_admins("has respawned.", M)
