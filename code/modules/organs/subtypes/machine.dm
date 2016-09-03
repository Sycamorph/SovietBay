/obj/item/organ/internal/cell
	name = "microbattery"
	desc = "A small, powerful cell for use in fully prosthetic bodies."
	icon = 'icons/obj/power.dmi'
	icon_state = "scell"
	organ_tag = BP_CELL
	parent_organ = BP_CHEST
	vital = 1

/obj/item/organ/internal/cell/New()
	robotize()
	..()

/obj/item/organ/internal/cell/replaced()
	..()
	// This is very ghetto way of rebooting an IPC. TODO better way.
	if(owner && owner.stat == DEAD)
		owner.stat = 0
		owner.visible_message("<span class='danger'>\The [owner] twitches visibly!</span>")

/obj/item/organ/cooler
	name = "cooler"
	organ_tag = "cooler"
	parent_organ = "chest"
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "motor"
	dead_icon = "motor_broken"

	var/max_hot_temperature = 2000
	var/max_cold_temperature = -1
	var/temp_cold = 7.5
	var/target_temp = 313
	var/enabled = 0

/obj/item/organ/cooler/New()
	robotize()
	..()

/obj/item/organ/cooler/process()
	..()
	if(owner.nutrition < 5) return //no cooling if charge is too low
	if(!enabled)
		if(owner.bodytemperature > owner.species.heat_level_1)
			enabled = 1
			owner << "Cooler enabled"
		return
	var/bt = owner.bodytemperature
	if(bt > max_hot_temperature || bt < max_cold_temperature)
		take_damage(0.1)
	if(!is_broken())
		if(!is_bruised())
			if(bt < target_temp)
				return
			else if(bt > owner.species.heat_level_1)
				bt -= temp_cold*2
				owner.nutrition -= 1
			else
				owner.nutrition -= 0.1
				if((bt - temp_cold) < target_temp)
					bt -= (bt - target_temp)
				else
					bt -= temp_cold
		else
			bt -= temp_cold/2
	owner.bodytemperature = bt

// Used for an MMI or posibrain being installed into a human.
/obj/item/organ/internal/mmi_holder
	name = "brain interface"
	organ_tag = BP_BRAIN
	parent_organ = BP_HEAD
	vital = 1
	var/obj/item/device/mmi/stored_mmi
	var/datum/mind/persistantMind //Mind that the organ will hold on to after being removed, used for transfer_and_delete
	var/ownerckey // used in the event the owner is out of body

/obj/item/organ/internal/mmi_holder/Destroy()
	stored_mmi = null
	return ..()

/obj/item/organ/internal/mmi_holder/New(var/mob/living/carbon/human/new_owner, var/internal)
	..(new_owner, internal)
	if(!stored_mmi)
		stored_mmi = new(src)
	sleep(-1)
	update_from_mmi()
	persistantMind = owner.mind
	ownerckey = owner.ckey

/obj/item/organ/internal/mmi_holder/proc/update_from_mmi()

	if(!stored_mmi.brainmob)
		stored_mmi.brainmob = new(stored_mmi)
		stored_mmi.brainobj = new(stored_mmi)
		stored_mmi.brainmob.container = stored_mmi
		stored_mmi.brainmob.real_name = owner.real_name
		stored_mmi.brainmob.name = stored_mmi.brainmob.real_name
		stored_mmi.name = "[initial(stored_mmi.name)] ([owner.real_name])"

	if(!owner) return

	name = stored_mmi.name
	desc = stored_mmi.desc
	icon = stored_mmi.icon

	stored_mmi.icon_state = "mmi_full"
	icon_state = stored_mmi.icon_state

	if(owner && owner.stat == DEAD)
		owner.stat = 0
		owner.switch_from_dead_to_living_mob_list()
		owner.visible_message("<span class='danger'>\The [owner] twitches visibly!</span>")

/obj/item/organ/internal/mmi_holder/removed()
	if(owner && owner.mind)
		persistantMind = owner.mind
		if(owner.ckey)
			ownerckey = owner.ckey
	..()

/obj/item/organ/internal/mmi_holder/proc/transfer_and_delete()
	if(stored_mmi)
		stored_mmi.forceMove(src.loc)
		if(persistantMind)
			persistantMind.transfer_to(stored_mmi.brainmob)
		else
			var/response = input(find_dead_player(ownerckey, 1), "Your [initial(stored_mmi.name)] has been removed from your body. Do you wish to return to life?", "Robotic Rebirth") as anything in list("Yes", "No")
			if(response == "Yes")
				persistantMind.transfer_to(stored_mmi.brainmob)
	qdel(src)


/obj/item/organ/internal/mmi_holder/posibrain
	name = "positronic brain interface"
	parent_organ = BP_CHEST

/obj/item/organ/internal/mmi_holder/posibrain/New()
	stored_mmi = new /obj/item/device/mmi/digital/posibrain(src)
	..()

/obj/item/organ/internal/mmi_holder/posibrain/update_from_mmi()
	..()
	stored_mmi.icon_state = "posibrain-occupied"
	icon_state = stored_mmi.icon_state

