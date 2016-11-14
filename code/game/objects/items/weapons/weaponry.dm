
/obj/item/weapon/nullrod
	name = "null rod"
	desc = "A rod of pure obsidian, its very presence disrupts and dampens the powers of paranormal phenomenae."
	icon_state = "nullrod"
	item_state = "nullrod"
	slot_flags = SLOT_BELT
	force = 15
	throw_speed = 1
	throw_range = 4
	throwforce = 10
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/nullrod/attack(mob/M as mob, mob/living/user as mob) //Paste from old-code to decult with a null rod.
	admin_attack_log(user, M, "Attacked using \a [src]", "Was attacked with \a [src]", "used \a [src] to attack")

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(M)
	//if(user != M)
	if(M.spell_list.len)
		M.silence_spells(300) //30 seconds
		to_chat(M, "<span class='danger'>You've been silenced!</span>")
		return

	if (!(istype(user, /mob/living/carbon/human) || ticker) && ticker.mode.name != "monkey")
		to_chat(user, "<span class='danger'>You don't have the dexterity to do this!</span>")
		return

	if ((CLUMSY in user.mutations) && prob(50))
		to_chat(user, "<span class='danger'>The rod slips out of your hand and hits your head.</span>")
		user.take_organ_damage(10)
		user.Paralyse(20)
		return

	if (M.stat !=2)
		if(cult && (M.mind in cult.current_antagonists) && prob(33))
			to_chat(M, "<span class='danger'>The power of [src] clears your mind of the cult's influence!</span>")
			to_chat(user, "<span class='danger'>You wave [src] over [M]'s head and see their eyes become clear, their mind returning to normal.</span>")
			cult.remove_antagonist(M.mind)
			M.visible_message("<span class='danger'>\The [user] waves \the [src] over \the [M]'s head.</span>")
		else if(prob(10))
			to_chat(user, "<span class='danger'>The rod slips in your hand.</span>")
			..()
		else
			to_chat(user, "<span class='danger'>The rod appears to do nothing.</span>")
			M.visible_message("<span class='danger'>\The [user] waves \the [src] over \the [M]'s head.</span>")
			return

	if(ishuman(M)) //Typecasting, only humans can be vampires
		var/mob/living/carbon/human/H = M

		if(isvampire(H) && user.mind && (user.mind.assigned_role == "Chaplain")) //Fuck up vampires by smithing the shit out of them. Shock and Awe!
			if(!(VAMP_SHADOW in H.mind.vampire.powers))
				H << "\red The [src]'s power violently interferes with your own!"
				if(H.mind.vampire.nullified < 5) //Don't actually reduce their debuff if it's over 5
					H.mind.vampire.nullified = max(5, H.mind.vampire.nullified + 2)
				H.mind.vampire.smitecounter += 30 //Smithe the shit out of him. Four strikes and he's out

/obj/item/weapon/nullrod/pickup(mob/living/user as mob)
	if(user.mind)
		if(user.mind.assigned_role == "Chaplain")
			user << "<span class='notice'>The obsidian rod is teeming with divine power. You feel like you could pulverize a horde of undead with this.</span>"
		if(ishuman(user)) //Typecasting, only humans can be vampires
			var/mob/living/carbon/human/H = user
			if(isvampire(H) && !(VAMP_SHADOW in H.mind.vampire.powers))
				H.mind.vampire.smitecounter += 60
				H << "<span class='danger'>You feel an unwanted presence as you pick up the rod. Your body feels like it is burning from the inside!</span>"

/obj/item/weapon/nullrod/afterattack(atom/A, mob/user as mob, proximity)
	if(!proximity)
		return
	if (istype(A, /turf/simulated/floor))
		to_chat(user, "<span class='notice'>You hit the floor with the [src].</span>")
		call(/obj/effect/rune/proc/revealrunes)(src)

/obj/item/weapon/energy_net
	name = "energy net"
	desc = "It's a net made of green energy."
	icon = 'icons/effects/effects.dmi'
	icon_state = "energynet"
	throwforce = 0
	force = 0
	var/net_type = /obj/effect/energy_net

/obj/item/weapon/energy_net/dropped()
	..()
	spawn(10)
		if(src) qdel(src)

/obj/item/weapon/energy_net/throw_impact(atom/hit_atom)
	..()

	var/mob/living/M = hit_atom

	if(!istype(M) || locate(/obj/effect/energy_net) in M.loc)
		qdel(src)
		return 0

	var/turf/T = get_turf(M)
	if(T)
		var/obj/effect/energy_net/net = new net_type(T)
		net.capture_mob(M)
		qdel(src)

	// If we miss or hit an obstacle, we still want to delete the net.
	spawn(10)
		if(src) qdel(src)

/obj/effect/energy_net
	name = "energy net"
	desc = "It's a net made of green energy."
	icon = 'icons/effects/effects.dmi'
	icon_state = "energynet"

	density = 1
	opacity = 0
	mouse_opacity = 1
	anchored = 1
	can_buckle = 0 //no manual buckling or unbuckling

	var/health = 25
	var/countdown = -1

/obj/effect/energy_net/teleport
	countdown = 60

/obj/effect/energy_net/proc/capture_mob(mob/living/M)
	if(M.buckled)
		M.buckled.unbuckle_mob()
	buckle_mob(M)

/obj/effect/energy_net/post_buckle_mob(mob/living/M)
	if(buckled_mob)
		plane = ABOVE_HUMAN_PLANE
		layer = ABOVE_HUMAN_LAYER
		visible_message("\The [M] was caught in an energy net!")
	else
		to_chat(M, "You are free of the net!")
		reset_plane_and_layer()
		qdel(src)

/obj/effect/energy_net/proc/healthcheck()
	if(health <=0)
		density = 0
		src.visible_message("The energy net is torn apart!")
		unbuckle_mob()

/obj/effect/energy_net/bullet_act(var/obj/item/projectile/Proj)
	health -= Proj.get_structure_damage()
	healthcheck()
	return 0

/obj/effect/energy_net/ex_act()
	health = 0
	healthcheck()

/obj/effect/energy_net/attack_hand(var/mob/user)

	var/mob/living/carbon/human/H = user
	if(istype(H))
		if(H.species.can_shred(H))
			playsound(src.loc, 'sound/weapons/slash.ogg', 80, 1)
			health -= rand(10, 20)
		else
			health -= rand(1,3)

	else if (HULK in user.mutations)
		health = 0
	else
		health -= rand(5,8)

	to_chat(H, "<span class='danger'>You claw at the energy net.</span>")

	healthcheck()
	return

/obj/effect/energy_net/attackby(obj/item/weapon/W as obj, mob/user as mob)
	health -= W.force
	healthcheck()
	..()
