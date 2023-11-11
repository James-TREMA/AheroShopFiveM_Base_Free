return {
	['testburger'] = {
		label = 'Burger Test',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'quel burger incroyablement délicieux, n’est-ce pas ?'
		},
		buttons = {
			{
				label = 'Le lécher',
				action = function(slot)
					print('Vous avez léché le burger')
				end
			},
			{
				label = 'Le presser',
				action = function(slot)
					print('Vous avez pressé le burger :(')
				end
			},
			{
				label = 'Comment appelle-t-on un burger végan ?',
				group = 'Blagues sur les Hamburgers',
				action = function(slot)
					print('Une erreur de steak.')
				end
			},
			{
				label = 'Qu’est-ce que les grenouilles aiment manger avec leurs hamburgers ?',
				group = 'Blagues sur les Hamburgers',
				action = function(slot)
					print('Des mouches françaises.')
				end
			},
			{
				label = 'Pourquoi le burger et les frites couraient-ils ?',
				group = 'Blagues sur les Hamburgers',
				action = function(slot)
					print('Parce qu’ils sont de la restauration rapide.')
				end
			}
		},
		consume = 0.3
	},
	
	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = "L'argent sale",
	},

	['burger'] = {
		label = 'Hamburger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Vous avez mangé un délicieux hamburger'
		},
	},

	['cola'] = {
		label = 'Coca cola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Vous avez étanché votre soif avec du cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Ordures',
	},

	['paperbag'] = {
		label = 'Sac en papier',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Culotte',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Téléphone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Argent',
	},
	
	['mustard'] = {
		label = 'Moutarde',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'Vous avez... bu de la moutarde'
		}
	},
	
	['water'] = {
		label = 'Eau',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Vous avez bu de l’eau rafraîchissante'
		}
	},
	
	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},
	
	['armour'] = {
		label = 'Gilet pare-balles',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},
	
	['clothing'] = {
		label = 'Vêtements',
		consume = 0,
	},
	
	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},
	
	['scrapmetal'] = {
		label = 'Métal de récupération',
		weight = 80,
	},
	
	["alive_chicken"] = {
		label = "Poulet vivant",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["blowpipe"] = {
		label = "Chalumeau",
		weight = 2,
		stack = true,
		close = true,
	},
	
	["bread"] = {
		label = "Pain",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},
	
	["carokit"] = {
		label = "Kit de carrosserie",
		weight = 3,
		stack = true,
		close = true,
	},
	
	["carotool"] = {
		label = "Outils",
		weight = 2,
		stack = true,
		close = true,
	},
	
	["clothe"] = {
		label = "Tissu",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["copper"] = {
		label = "Cuivre",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["cutted_wood"] = {
		label = "Bois coupé",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["diamond"] = {
		label = "Diamant",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["essence"] = {
		label = "Essence",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fabric"] = {
		label = "Tissu",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fish"] = {
		label = "Poisson",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["fixkit"] = {
		label = "Kit de réparation",
		weight = 3,
		stack = true,
		close = true,
	},
	
	["fixtool"] = {
		label = "Outils de réparation",
		weight = 2,
		stack = true,
		close = true,
	},
	
	["gazbottle"] = {
		label = "Bouteille de gaz",
		weight = 2,
		stack = true,
		close = true,
	},
	
	["gold"] = {
		label = "Or",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["iron"] = {
		label = "Fer",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},
	
	["medikit"] = {
		label = "Trousse de secours",
		weight = 2,
		stack = true,
		close = true,
	},
	
	["packaged_chicken"] = {
		label = "Filet de poulet",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["packaged_plank"] = {
		label = "Bois emballé",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["petrol"] = {
		label = "Pétrole",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["petrol_raffin"] = {
		label = "Pétrole raffiné",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["slaughtered_chicken"] = {
		label = "Poulet abattu",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["stone"] = {
		label = "Pierre",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["washed_stone"] = {
		label = "Pierre lavée",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["wood"] = {
		label = "Bois",
		weight = 1,
		stack = true,
		close = true,
	},
	
	["wool"] = {
		label = "Laine",
		weight = 1,
		stack = true,
		close = true,
	},
}