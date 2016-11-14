/datum/event/gravity
	announceWhen = 5

/datum/event/gravity/setup()
	endWhen = rand(15, 60)

/datum/event/gravity/announce()
	command_announcement.Announce("��������� ����� ���� � ������� ��������� �����. �����������&#255; ���������&#255; ���� ��������� ���&#255;�� � ������������ �������. ���������� ������ ����� �������� � ��������������� �������� � ������������� ������ ���.", "����� ����������")

/datum/event/gravity/start()
	gravity_is_on = 0
	for(var/area/A in world)
		if(A.z in using_map.station_levels)
			A.gravitychange(gravity_is_on)

/datum/event/gravity/end()
	if(!gravity_is_on)
		gravity_is_on = 1

		for(var/area/A in world)
			if(A.z in using_map.station_levels)
				A.gravitychange(gravity_is_on)

		command_announcement.Announce("�������������� ���������� ����� ������������� � ���������� ������. �������� �� ����������.", "�������������� ����������")
