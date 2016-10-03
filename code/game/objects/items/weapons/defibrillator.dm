/obj/item/weapon/defibrillator
	name = "defibrillator"
	desc = "Device to treat ventricular fibrillation or pulseless ventricular tachycardia."
	icon = 'icons/obj/defibrillator.dmi'
	var/item_icon = 'icons/obj/defibrillator.dmi'
	//icon_state = "Defibunit"
	item_state = "defibunit"
	icon_state = "defibunit"
	var/state_on = "defibunit_on"
	action_button_name = "Switch Defibrillator"
	//flags = FPRINT | TABLEPASS
	w_class = 3.0
	damtype = "brute"
	force = 4
	var/charged = 0
	var/charge = 2
	var/maxcharge = 5
	origin_tech = "combat=2;biotech=2"

	attack_self(mob/user as mob)
		if(!charged)
			if(charge)
				user.visible_message("[user] charges their [src].", "You charge your [src].</span>", "You hear electrical zap.")
				sleep(30)
				playsound(src, 'sound/items/defib_charge.ogg', 50, 1, 1)
				charged = 1
				spawn(25)
					/*if(wet)
						var/turf/T = get_turf(src)
						T.visible_message("<span class='wet'>Some wet device has been discharged!</span>")
						if(istype(loc, /mob/living))
							var/mob/living/L = loc
							L.Weaken(6)
							var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
							s.set_up(3, 1, src)
							s.start()
						discharge()
						return*/
					charged = 2
					//icon_state = "Defibunit_on"
					icon_state = state_on
					damtype = "fire"
					force = 20
			else
				user<<"Internal battery worn out. Recharge needed."

	proc/discharge()
		//icon_state = "Defibunit"
		icon_state = initial(icon_state)
		damtype = "brute"
		charged = 0
		force = initial(force)
		charge--

	attack(mob/M as mob, mob/user as mob)
		if(charged == 2 && istype(M,/mob/living/carbon))
			var/mob/living/carbon/C = M
			src.add_fingerprint(user)
			playsound(src, 'sound/items/defib_zap.ogg', 50, 1, 1)
			user.visible_message("[user] shocks [M] with [src].", "You shock [M] with [src].</span>", "You hear electricity zaps flesh.")
			admin_attack_log(user, "Shock [M.name] ([M.ckey]) with [src.name]")
			msg_admin_attack("[user.name] ([user.ckey]) shock [M.name] ([M.ckey]) with [src.name] (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")

			if((world.time - C.timeofdeath) < 3600 || C.stat != DEAD)	//if he is dead no more than 6 minutes
				if(!(NOCLONE in C.mutations))
					if(C.health<=config.health_threshold_crit || prob(10))
						var/suff = min(C.getOxyLoss(), 20)
						C.adjustOxyLoss(-suff)
						C.updatehealth()
						if(C.stat == DEAD && C.health>config.health_threshold_dead)
							C.stat = UNCONSCIOUS
					else
						C.adjustFireLoss(5)
						if(C.stat == DEAD && C.health>config.health_threshold_dead)
							C.stat = CONSCIOUS
					C.tod = null
					C.timeofdeath = 0
					dead_mob_list_ -= C

				/*if(wet)
					var/turf/T = get_turf(src)
					T.visible_message("<span class='wet'>Some wet device has been discharged!</span>")
					if(istype(loc, /mob/living))
						var/mob/living/L = loc
						L.Weaken(6)
						var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
						s.set_up(3, 1, src)
						s.start()*/

			discharge()
			C.apply_effect(4, STUN, 0)
			C.apply_effect(4, WEAKEN, 0)
			C.apply_effect(4, STUTTER, 0)
			if(C.jitteriness<=100)
				C.make_jittery(150)
			else
				C.make_jittery(50)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(3, 1, C)
			s.start()
		else return ..(M,user)

datum/design/defibrillators
	name = "Defibrillators"
	desc = "Defibrillators to revive people."
	id = "defibrillators"
	req_tech = list("combat" = 2,"biotech" = 2)
	build_type = 2 //PROTOLATHE
	materials = list(MAT_METAL = 2000, MAT_GLASS = 50)
	build_path = /obj/item/weapon/defibrillator



/obj/item/weapon/defibrillator/proc/fully_charged()
	return (charge == maxcharge)

/obj/item/weapon/defibrillator/proc/give(var/amount)
	var/amount_used = min(maxcharge-charge,amount)
	charge += amount_used
	return amount_used