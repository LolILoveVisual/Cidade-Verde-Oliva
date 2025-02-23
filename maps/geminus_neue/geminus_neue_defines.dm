#define Z_LEVEL_FIRST_GEMINUS						1
#define Z_LEVEL_SECOND_GEMINUS					2
#define Z_LEVEL_THIRD_GEMINUS						3
#define Z_LEVEL_FOURTH_GEMINUS					4

/datum/map/geminus_neue
	name = "Geminus"
	full_name = "Cidade Verde Oliva"
	path = "geminus"

	lobby_icon = 'icons/misc/title.dmi'
	lobby_screens = list("pollux")

	zlevel_datum_type = /datum/map_z_level/geminus_neue

	station_name  = "Cidade Verde Oliva"
	station_short = "Verde-Oliva"
	dock_name     = "Cidade Verde Oliva Airbus"
	boss_name     = "Governo Central de Verde-Oliva"
	boss_short    = "Governo VerdeOliva"
	company_name  = "Agência Espacial Brasileira"
	company_short = "AEB"
	starsys_name  = "Vetra"

	shuttle_docked_message = "The scheduled air shuttle to the %dock_name% has arrived far east of the city. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Civilian Transfer shuttle has left. Estimate %ETA% until the airbus docks at %dock_name%."
	shuttle_called_message = "A civilian transfer to %Dock_name% has been scheduled. The airbus has been called. Those leaving should procede to the far east side of the city by %ETA%"
	shuttle_recall_message = "The scheduled civilian transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Evacuation Shuttle has arrived at the far east side of the city. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the city. Estimate %ETA% until the shuttle docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive at the east side of the city in approximately %ETA%"
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	allowed_spawns = list("City Arrivals Airbus", "Cryogenic Storage", "Prison")

//	planet_datums_to_make = list(/datum/planet/pollux)

	usable_email_tlds = list("freemail.net", "ntmail.nt", "interpollux.org", "solnet.org", "vetralife.nt", "andromedian.org")
	default_law_type = /datum/ai_laws/pollux

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
//							NETWORK_ENGINEERING_OUTPOST,
							NETWORK_DEFAULT,
							NETWORK_MEDICAL,
//							NETWORK_MINE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
//							NETWORK_PRISON,
							NETWORK_SECURITY,
//							NETWORK_INTERROGATION
							)

	council_email = "city-council@brasil.aeb"

// For making the 6-in-1 holomap, we calculate some offsets
#define GEMINUS_MAP_SIZE 332 // Width and height of compiled in Southern Cross z levels.
#define GEMINUS_HOLOMAP_CENTER_GUTTER 40 // 40px central gutter between columns
#define GEMINUS_HOLOMAP_MARGIN_X ((HOLOMAP_ICON_SIZE - (2*GEMINUS_MAP_SIZE) - GEMINUS_HOLOMAP_CENTER_GUTTER) / 2) // 100
#define GEMINUS_HOLOMAP_MARGIN_Y ((HOLOMAP_ICON_SIZE - (3*GEMINUS_MAP_SIZE)) / 2) // 60


/datum/map/geminus_neue/perform_map_generation()

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_FIRST_GEMINUS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_FIRST_GEMINUS, world.maxx, world.maxy)         // Create the mining ore distribution map.
	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_FIRST_GEMINUS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_FIRST_GEMINUS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	return 1

/datum/map_z_level/geminus_neue/first
	z = Z_LEVEL_FIRST_GEMINUS
	name = "Underground Sewers"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	transit_chance = 50
	base_turf = /turf/simulated/floor/plating
//	holomap_legend_x = 220
//	holomap_legend_y = 200

/datum/map_z_level/geminus_neue/second
	z = Z_LEVEL_SECOND_GEMINUS
	name = "Cidade Verde Oliva"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	transit_chance = 50
	base_turf = /turf/simulated/floor/outdoors/dirt
//	holomap_offset_x = 220
//	holomap_offset_y = GEMINUS_HOLOMAP_MARGIN_Y + GEMINUS_MAP_SIZE*1


/datum/map_z_level/geminus_neue/third
	z = Z_LEVEL_THIRD_GEMINUS
	name = "Sky"
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_SEALED
	transit_chance = 50
	base_turf = /turf/simulated/floor/outdoors/dirt
//	holomap_offset_x = GEMINUS_HOLOMAP_MARGIN_X - 40
//	holomap_offset_y = GEMINUS_HOLOMAP_MARGIN_Y + GEMINUS_MAP_SIZE*0

/datum/map_z_level/geminus_neue/fourth
	z = Z_LEVEL_FOURTH_GEMINUS
	name = "Geminus Residenial Area"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_SEALED
	transit_chance = 50
	base_turf = /turf/simulated/floor/outdoors/dirt

/datum/planet/pollux
	expected_z_levels = list(
		Z_LEVEL_SECOND_GEMINUS,
		Z_LEVEL_THIRD_GEMINUS,
		Z_LEVEL_FOURTH_GEMINUS,
	)

/datum/map/geminus_neue/get_map_info()
	. = list()
	. +=  "[full_name] É uma cidade-côlonia da super-potência chamada Federação do Brasil<br>"
	. +=  "A Pollux existe no sistema estelar Vetra, que é totalmente monopolizado pela Agencia Espacial Brasileira(AEB), que atua como um governo quase corporativo."
	. +=  "Criada em 1977 Inicialmente uma colônia de mineração, Verde-Oliva tem uma história rica e é o lar de muitos descendentes dos primeiros garimpeiros.<br> "
	. +=  "Há uma luta de classes bem definida, pois os olivianos da classe trabalhadora se sentem expulsos pelos colonos mais ricos que desejam gentrificar ainda mais a cidade e torná-la... <i>mais lucrativo, mais corporativo, mais <b>chic</b></i>."
	return jointext(., "<br>")
