DS_Casino_System_LuckWheel	= {
	Target = ox_target, --false or 'qtarget' / 'ox_target' / 'qb-target'

	DailySpin = true, --IF ENABLED PLAYER CAN SPIN ONE TIME PER DAY

	ResetSpin = '16', --RESET SPIN HOUR

	SpinMoney = 5000, -- HOW MUCH SPIN COST? (ONLY WORKS IF DailySpin = false)

	SpinCooldown = 1, --HOW MANY MINUTES BEFORE SPINNING ANOTHER TIME? (ONLY WORKS IF DailySpin = false)

	VehicleWinPos = {x = 906.4901, y = -34.71921, z = 78.76398, h = 58.75988},	--VEHICLE SPAWN COORDS WHEN A PLAYER WIN THAT
	
	Vehicle = 'civ18char', --VEHICLE WIN NAME

	VehiclePlate = 'RRP', --SHOWN VEHICLE PLATE

	PlateLetters = 3, --THE MAXIMUM PLATE LENGHT IS 8 CHARS (INCLUDING SPACES)
	
	PlateNumbers = 3, --THE MAXIMUM PLATE LENGHT IS 8 CHARS (INCLUDING SPACES)

	PlateSpace = false, --ENABLE/DISABLE SPACE IN PLATES

	Prices = { --PROBABILITY FROM 1 TO 100 (IMPORTANT DON'T PUT SAME PROBABILITY OF OTHER ITEMS)
		[1]  = {type = 'car',   	name = 'car', 			count = 1, 		sound = 'car', 		probability = 1},
		[2]  = {type = 'item', 		name = 'diamond', 		count = 5, 	    sound = 'win', 		probability = 68},
		[3]  = {type = 'item', 		name = 'casino_chips',  count = 2000, 	sound = 'clothes', 	probability = 77},
		[4]  = {type = 'item', 		name = 'casino_chips', 	count = 25000, 	sound = 'chips', 	probability = 34},
		[5]  = {type = 'account', 	name = 'money', 		count = 40000, 	sound = 'cash', 	probability = 14},
		[6]  = {type = 'item', 		name = 'casino_chips', 	count = 50000, 	sound = 'win', 		probability = 12},
		[7]  = {type = 'item', 		name = 'casino_chips',  count = 8000, 	sound = 'clothes', 	probability = 32},
		[8]  = {type = 'item', 		name = 'weapon_bread',  count = 1, 		sound = 'mystery', 	probability = 5},
		[9]  = {type = 'item', 		name = 'casino_chips', 	count = 20000, 	sound = 'chips', 	probability = 23},
		[10] = {type = 'account', 	name = 'money', 		count = 10000, 	sound = 'win', 		probability = 49},
		[11] = {type = 'item',		name = 'casino_chips', 	count = 4000, 	sound = 'clothes', 	probability = 52},
		[12] = {type = 'item', 		name = 'casino_chips', 	count = 15000, 	sound = 'chips', 	probability = 18},
		[13] = {type = 'account', 	name = 'money', 		count = 30000, 	sound = 'cash', 	probability = 20},
		[14] = {type = 'account', 	name = 'money', 		count = 5000, 	sound = 'win', 		probability = 55},
		[15] = {type = 'item', 		name = 'casino_chips', 	count = 1000, 	sound = 'win', 		probability = 60},
		[16] = {type = 'item',		name = 'casino_chips', 	count = 10000, 	sound = 'chips', 	probability = 48},
		[17] = {type = 'account',	name = 'money', 		count = 20000, 	sound = 'cash', 	probability = 35},
		[18] = {type = 'item', 		name = 'casino_chips', 	count = 4000, 	sound = 'win', 		probability = 40},
		[19] = {type = 'item', 		name = 'casino_chips', 	count = 3000, 	sound = 'clothes', 	probability = 50},
		[20] = {type = 'account', 	name = 'money', 		count = 50000, 	sound = 'cash', 	probability = 20}
	}
}