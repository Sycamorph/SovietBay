/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = istype(src.wear_mask, /obj/item/clothing/mask/muzzle)
	//var/m_type = VISIBLE_MESSAGE

	for (var/obj/item/weapon/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	if(src.stat == 2.0 && (act != "deathgasp"))
		return
	switch(act)

		if ("airguitar")
			if (!src.restrained())
				message =  "������ �� ������������ ������, ����&#255; �������."
				m_type = VISIBLE_MESSAGE

		if ("beep")
			if (src.isSynthetic())
				message = "beeps."
				playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 0)
				m_type = VISIBLE_MESSAGE
			else
				return

		if ("ping")
			if (src.isSynthetic())
				message = "pings."
				playsound(src.loc, 'sound/machines/ping.ogg', 50, 0)
				m_type = VISIBLE_MESSAGE
			else
				return

		if ("buzz")
			if (src.isSynthetic())
				message = "buzzes."
				playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 50, 0)
				m_type = VISIBLE_MESSAGE
			else
				return

		if ("confirm")
			if (src.isSynthetic())
				message = "emits an affirmative blip."
				playsound(src.loc, 'sound/machines/synth_yes.ogg', 50, 0)
				m_type = VISIBLE_MESSAGE
			else
				return

		if ("deny")
			if (src.isSynthetic())
				message = "emits a negative blip."
				playsound(src.loc, 'sound/machines/synth_no.ogg', 50, 0)
				m_type = VISIBLE_MESSAGE
			else
				return

		if ("blink")
			message = "�������."
			m_type = VISIBLE_MESSAGE

		if ("blink_r")
			message = "������ �������."
			m_type = VISIBLE_MESSAGE

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "����&#255;���&#255; [param]."
				else
					message = "����&#255;���&#255;."
			m_type = VISIBLE_MESSAGE

		if ("custom")
			var/input = sanitize(input("Choose an emote to display.") as text|null)
			if (!input)
				return
			var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = VISIBLE_MESSAGE
			else if (input2 == "Hearable")
				if (src.miming)
					return
				m_type = AUDIBLE_MESSAGE
			else
				alert("Unable to use this emote, must be either hearable or visible.")
				return
			return custom_emote(m_type, message)

		if ("me")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					to_chat(src, "<span class='warning'>You cannot send IC messages (muted).</span>")
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "����� ����� [param]."
				else
					message = "����� �����."
			m_type = VISIBLE_MESSAGE

		if ("choke")
			if (!muzzled)
				message = "chokes!"
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a strong noise."
				m_type = AUDIBLE_MESSAGE

		if("vomit")
			vomit()
			return

		if ("clap")
			if (!src.restrained())
				message = "�������."
				m_type = AUDIBLE_MESSAGE
		if ("flap")
			if (!src.restrained())
				message = "������ �����&#255;��."
				m_type = VISIBLE_MESSAGE

		if ("aflap")
			if (!src.restrained())
				message = "������ ������ �����&#255;��!"
				m_type = AUDIBLE_MESSAGE

		if ("drool")
			message = "������� �����."
			m_type = VISIBLE_MESSAGE

		if ("eyebrow")
			message = "[get_visible_gender() == MALE ? "����&#255;�" : get_visible_gender() == FEMALE ? "����&#255;��" : "���������"] �����."
			m_type = VISIBLE_MESSAGE

		if ("chuckle")
			if (!muzzled)
				message = "chuckles."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a noise."
				m_type = AUDIBLE_MESSAGE

		if ("twitch")
			message = "������ ��������&#255;."
			m_type = VISIBLE_MESSAGE

		if ("twitch_s")
			message = "������������&#255;."
			m_type = VISIBLE_MESSAGE

		if ("faint")
			message = "[get_visible_gender() == MALE ? "�����&#255;�" : get_visible_gender() == FEMALE ? "�����&#255;��" : "���&#255;��"] ��������."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = VISIBLE_MESSAGE

		if ("cough")
			if (!muzzled)
				message = "coughs!"
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a strong noise."
				m_type = AUDIBLE_MESSAGE

		if ("frown")
			message = "[get_visible_gender() == MALE ? "���������&#255;" : get_visible_gender() == FEMALE ? "�����������" : "�������&#255;"]."
			m_type = VISIBLE_MESSAGE

		if ("nod")
			message = "������ �������."
			m_type = VISIBLE_MESSAGE

		if ("blush")
			message = "��������."
			m_type = VISIBLE_MESSAGE

		if ("wave")
			message = "�������&#255;."
			m_type = VISIBLE_MESSAGE

		if ("gasp")
			if (!muzzled)
				message = "gasps!"
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a weak noise."
				m_type = AUDIBLE_MESSAGE

		if ("deathgasp")
			message = "[species.get_death_message()]"
			m_type = VISIBLE_MESSAGE

		if ("giggle")
			if (!muzzled)
				message = "giggles."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a noise."
				m_type = AUDIBLE_MESSAGE

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "������� ������� �� [param]."
			else
				message = "������� �������."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "������� �� [param]."
			else
				message = "�������."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "������� �� [param]."
			else
				message = "�������."
			m_type = VISIBLE_MESSAGE

		if ("grin")
			message = "�����&#255;���&#255;."
			m_type = VISIBLE_MESSAGE

		if ("cry")
			if (!muzzled)
				message = "������."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a weak noise. [get_visible_gender() == MALE ? "He" : get_visible_gender() == FEMALE ? "She" : "They"] [get_visible_gender() == NEUTER ? "frown" : "frowns"]."
				m_type = AUDIBLE_MESSAGE

		if ("sigh")
			if (!muzzled)
				message = "[get_visible_gender() == MALE ? "��������" : get_visible_gender() == FEMALE ? "���������" : "��������"]."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a weak noise."
				m_type = AUDIBLE_MESSAGE

		if ("laugh")
			if (!muzzled)
				message = "laughs."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a noise."
				m_type = AUDIBLE_MESSAGE

		if ("mumble")
			message = "��������."
			m_type = 2

		if ("grumble")
			if (!muzzled)
				message = "������!"
				m_type = AUDIBLE_MESSAGE
			else
				message = "[get_visible_gender() == MALE ? "�����" : get_visible_gender() == FEMALE ? "������" : "������"] ���&#255;��� ����."
				m_type = AUDIBLE_MESSAGE

		if ("groan")
			if (!muzzled)
				message = "groans!"
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a loud noise."
				m_type = AUDIBLE_MESSAGE

		if ("moan")
			message = "moans!"
			m_type = AUDIBLE_MESSAGE

		if ("johnny")
			var/M
			if (param)
				M = param
			if (!M)
				param = null
			else
				message = "says, \"[M], please. He had a family.\" \The [src] takes a drag from a cigarette and blows his name out in smoke."
				m_type = AUDIBLE_MESSAGE


		if ("point")
			if (!src.restrained())
				var/mob/M = null
				if (param)
					for (var/atom/A as mob|obj|turf|area in view(null, null))
						if (param == A.name)
							M = A
							break

				if (!M)
					message = "���������� ����-��."
				else
					pointed(M)

				if (M)
					message = "���������� �� [M]."
				else
			m_type = VISIBLE_MESSAGE

		if ("raise")
			if (!src.restrained())
				message = "[get_visible_gender() == MALE ? "����&#255;�" : get_visible_gender() == FEMALE ? "����&#255;��" : "���������"] ����."
			m_type = VISIBLE_MESSAGE

		if("shake")
			message = "������ �������."
			m_type = VISIBLE_MESSAGE

		if ("shrug")
			message = "�������� �������."
			m_type = VISIBLE_MESSAGE

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "raises [t1] finger\s."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "raises [t1] finger\s."
			m_type = VISIBLE_MESSAGE

		if ("smile")
			message = "[get_visible_gender() == MALE ? "��������&#255;" : get_visible_gender() == FEMALE ? "����������" : "��������&#255;"]."
			m_type = VISIBLE_MESSAGE

		if ("shiver")
			message = "������."

		if ("pale")
			message = "�� ������� [get_visible_gender() == MALE ? "���������" : get_visible_gender() == FEMALE ? "����������" : "��������"]."
			m_type = VISIBLE_MESSAGE

		if ("tremble")
			message = "� ����� ������!"
			m_type = VISIBLE_MESSAGE

		if ("sneeze")
			if (!muzzled)
				message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�������" : "������"]."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a strange noise."
				m_type = AUDIBLE_MESSAGE

		if ("sniff")
			message = "�����."
			m_type = AUDIBLE_MESSAGE

		if ("snore")
			if (!muzzled)
				message = "snores."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a noise."
				m_type = AUDIBLE_MESSAGE

		if ("whimper")
			if (!muzzled)
				message = "whimpers."
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a weak noise."
				m_type = AUDIBLE_MESSAGE

		if ("wink")
			message = "[get_visible_gender() == MALE ? "���������" : get_visible_gender() == FEMALE ? "����������" : "�����������"]."
			m_type = VISIBLE_MESSAGE

		if ("yawn")
			if (!muzzled)
				message = "[get_visible_gender() == MALE ? "������" : get_visible_gender() == FEMALE ? "�������" : "������"]."
				m_type = AUDIBLE_MESSAGE

		if ("collapse")
			Paralyse(2)
			message = "[get_visible_gender() == MALE ? "����" : get_visible_gender() == FEMALE ? "�����" : "������"]!"
			m_type = AUDIBLE_MESSAGE

		if("hug")
			m_type = VISIBLE_MESSAGE
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					message = "[get_visible_gender() == MALE ? "���&#255;�" : get_visible_gender() == FEMALE ? "���&#255;��" : "��������"] [M]."
				else
					message = "[get_visible_gender() == MALE ? "���&#255;�" : get_visible_gender() == FEMALE ? "���&#255;��" : "��������"] ���&#255;."

		if ("handshake")
			m_type = VISIBLE_MESSAGE
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "shakes hands with [M]."
					else
						message = "holds out [get_visible_gender() == MALE ? "his" : get_visible_gender() == FEMALE ? "her" : "their"] hand to [M]."

		if("dap")
			m_type = VISIBLE_MESSAGE
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "gives daps to [M]."
				else
					message = "sadly can't find anybody to give daps to, and daps [get_visible_gender() == MALE ? "himself" : get_visible_gender() == FEMALE ? "herself" : "themselves"]. Shameful."

		if ("scream")
			if (!muzzled)
				message = "screams!"
				m_type = AUDIBLE_MESSAGE
			else
				message = "makes a very loud noise."
				m_type = AUDIBLE_MESSAGE

		if("swish")
			src.animate_tail_once()

		if("wag", "sway")
			src.animate_tail_start()

		if("qwag", "fastsway")
			src.animate_tail_fast()

		if("swag", "stopsway")
			src.animate_tail_stop()

		if ("help")
			var/help = {"blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough,
cry, custom, deathgasp, drool, eyebrow, frown, gasp, giggle, groan, grumble, handshake, hug-(none)/mob, glare-(none)/mob,
grin, laugh, look-(none)/mob, moan, mumble, nod, pale, point-atom, raise, salute, shake, shiver, shrug,
sigh, signal-#1-10, smile, sneeze, sniff, snore, stare-(none)/mob, tremble, twitch, twitch_s, whimper,
wink, yawn, swish, sway/wag, fastsway/qwag, stopsway/swag, vomit"}
			to_chat(src, help)
		else
			to_chat(src, "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>")




	if (message)
		log_emote("[name]/[key] : [message]")
		custom_emote(m_type,message)


/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	pose =  sanitize(input(usr, "This is [src]. [get_visible_gender() == MALE ? "He" : get_visible_gender() == FEMALE ? "She" : "They"] [get_visible_gender() == NEUTER ? "are" : "is"]...", "Pose", null)  as text)

/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavour Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	var/HTML = "<body>"
	HTML += "<tt><center>"
	HTML += "<b>Update Flavour Text</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=general'>General:</a> "
	HTML += TextPreview(flavor_texts["general"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=head'>Head:</a> "
	HTML += TextPreview(flavor_texts["head"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=face'>Face:</a> "
	HTML += TextPreview(flavor_texts["face"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=eyes'>Eyes:</a> "
	HTML += TextPreview(flavor_texts["eyes"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=torso'>Body:</a> "
	HTML += TextPreview(flavor_texts["torso"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=arms'>Arms:</a> "
	HTML += TextPreview(flavor_texts["arms"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=hands'>Hands:</a> "
	HTML += TextPreview(flavor_texts["hands"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=legs'>Legs:</a> "
	HTML += TextPreview(flavor_texts["legs"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=feet'>Feet:</a> "
	HTML += TextPreview(flavor_texts["feet"])
	HTML += "<br>"
	HTML += "<hr />"
	HTML +="<a href='?src=\ref[src];flavor_change=done'>\[Done\]</a>"
	HTML += "<tt>"
	src << browse(sanitize_local(HTML, SANITIZE_BROWSER), "window=flavor_changes;size=430x300")
