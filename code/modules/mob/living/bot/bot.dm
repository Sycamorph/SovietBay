/mob/living/bot
	name = "Bot"
	health = 20
	maxHealth = 20
	icon = 'icons/obj/aibots.dmi'
	universal_speak = 1
	density = 0
	var/obj/item/weapon/card/id/botcard = null
	var/list/botcard_access = list()
	var/on = 1
	var/open = 0
	var/locked = 1
	var/emagged = 0
	var/light_strength = 3
	var/obj/machinery/camera/botcam = null //Now all bots has cameras
	var/mob/living/silicon/ai/c_ai = null
	var/obj/access_scanner = null
	var/list/req_access = list()
	var/list/req_one_access = list()

/mob/living/bot/New()
	..()
	update_icons()

	botcard = new /obj/item/weapon/card/id(src)
	botcard.access = botcard_access.Copy()

	access_scanner = new /obj(src)
	access_scanner.req_access = req_access.Copy()
	access_scanner.req_one_access = req_one_access.Copy()

	botcam = new /obj/machinery/camera(src)
	botcam.c_tag = "[name]'s camera"
	botcam.anchored = 0

/mob/living/bot/Destroy()
	kick_ai()
	..()

/mob/living/bot/proc/assume_ai(var/mob/living/silicon/ai/M)

	M << "\blue Assuming control of [src]..."

	if(src.c_ai || src.client)
		M << "\red [src] already occupied by [src.c_ai]"
		return
	if(!src.on)
		M << "\red Connection timed out."
		return
	if(src.emagged)
		M << "\red Error. [src] control functions unavaliable."
		return

	src.client = M.client
	src.c_ai = M
	src << "\blue [src] assuming successful. AI functions will be temporarily unavailable."

/mob/living/bot/proc/kick_ai()
	if(!src.c_ai || !src.client)
		return
	src << "\blue [src] disconnected. All AI function has been restored."
	src.c_ai.client = src.client
	spawn(2)
		src.c_ai.eyeobj.setLoc(src.loc)
		src.c_ai = null


/mob/living/bot/Life()
	..()
	if(health <= 0)
		death()
		return
	weakened = 0
	stunned = 0
	paralysis = 0

	botcam.update_coverage()

/mob/living/bot/verb/Disconnect()
	set name="Disconnect"
	set category="Bot"
	kick_ai()

/mob/living/bot/verb/panel()
	set name="Control panel"
	set category="Bot"
	return attack_hand(usr)

/mob/living/bot/verb/self_destruct()
	set name="Self destruct"
	set category="Bot"
	if(alert("You sure?","Self destruct","Yes","No")=="Yes")
		explode()

/mob/living/bot/updatehealth()
	if(status_flags & GODMODE)
		health = maxHealth
		stat = CONSCIOUS
	else
		health = maxHealth - getFireLoss() - getBruteLoss()
	oxyloss = 0
	toxloss = 0
	cloneloss = 0
	halloss = 0

/mob/living/bot/death()
	explode()

/mob/living/bot/attackby(var/obj/item/O, var/mob/user)
	if(O.GetIdCard())
		if(access_scanner.allowed(user) && !open && !emagged)
			locked = !locked
			to_chat(user, "<span class='notice'>Controls are now [locked ? "locked." : "unlocked."]</span>")
			attack_hand(user)
		else
			if(emagged)
				to_chat(user, "<span class='warning'>ERROR</span>")
			if(open)
				to_chat(user, "<span class='warning'>Please close the access panel before locking it.</span>")
			else
				to_chat(user, "<span class='warning'>Access denied.</span>")
		return
	else if(istype(O, /obj/item/weapon/screwdriver))
		if(!locked)
			open = !open
			to_chat(user, "<span class='notice'>Maintenance panel is now [open ? "opened" : "closed"].</span>")
		else
			to_chat(user, "<span class='notice'>You need to unlock the controls first.</span>")
		return
	else if(istype(O, /obj/item/weapon/weldingtool))
		if(health < maxHealth)
			if(open)
				health = min(maxHealth, health + 10)
				user.visible_message("<span class='notice'>[user] repairs [src].</span>","<span class='notice'>You repair [src].</span>")
			else
				to_chat(user, "<span class='notice'>Unable to repair with the maintenance panel closed.</span>")
		else
			to_chat(user, "<span class='notice'>[src] does not need a repair.</span>")
		return
	else
		..()

/mob/living/bot/attack_ai(var/mob/user)
	return attack_hand(user)

/mob/living/bot/say(var/message)
	var/verb = "beeps"

	message = sanitize(message)

	..(message, null, verb)

/mob/living/bot/Bump(var/atom/A)
	if(on && botcard && istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		if(!istype(D, /obj/machinery/door/firedoor) && !istype(D, /obj/machinery/door/blast) && D.check_access(botcard))
			D.open()
	else
		..()

/mob/living/bot/emag_act(var/remaining_charges, var/mob/user)
	kick_ai()
	return 0

/mob/living/bot/proc/turn_on()
	if(stat)
		return 0
	on = 1
	set_light(light_strength)
	update_icons()
	return 1

/mob/living/bot/proc/turn_off()
	on = 0
	set_light(0)
	kick_ai()
	update_icons()

/mob/living/bot/proc/explode()
	kick_ai()
	qdel(src)

/mob/living/bot/proc/turf_is_targetable(var/turf/T)
	if(T.density)
		return 0
	for(var/atom/A in T.contents)
		if(!A.CanPass(src, T, 0.5))
			if(isairlock(A))
				var/obj/machinery/door/D = A
				if(D.allowed(src))
					continue
			return 0
	return 1
				
			
	
