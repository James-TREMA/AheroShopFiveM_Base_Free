local Jobs = setmetatable({}, {__index = function(_, key)
	return ESX.GetJobs()[key]
end})
local Jobs2 = setmetatable({}, {__index = function(_, key)
	return ESX.GetJobs2()[key]
end})

local RegisteredSocieties = {}
local SocietiesByName = {}

function GetSociety(name)
	return SocietiesByName[name]
end
exports("GetSociety", GetSociety)

function registerSociety(name, label, account, datastore, inventory, data)
	if SocietiesByName[name] then
		print(('[^3WARNING^7] society already registered, name: ^5%s^7'):format(name))
		return
	end

	local society = {
		name = name,
		label = label,
		account = account,
		datastore = datastore,
		inventory = inventory,
		data = data
	}

	SocietiesByName[name] = society
	table.insert(RegisteredSocieties, society)
end
AddEventHandler('esx_society:registerSociety', registerSociety)
exports("registerSociety", registerSociety)

AddEventHandler('esx_society:getSocieties', function(cb)
	cb(RegisteredSocieties)
end)

AddEventHandler('esx_society:getSociety', function(name, cb)
	cb(GetSociety(name))
end)

RegisterServerEvent('esx_society:checkSocietyBalance')
AddEventHandler('esx_society:checkSocietyBalance', function(society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)

	--if (xPlayer.job.name ~= society.name) or (xPlayer.job2.name ~= society.name) then
	--	print(('esx_society: %s attempted to call checkSocietyBalance!'):format(xPlayer.identifier))
	--	return
	--end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		TriggerClientEvent("esx:showNotification", xPlayer.source, TranslateCap('check_balance', ESX.Math.GroupDigits(account.money)))
	end)
end)

RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function(societyName, amount)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = ESX.Math.Round(tonumber(amount))
	--if (xPlayer.job.name ~= society.name) or (xPlayer.job2.name ~= society.name) then
	--	return print(('[^3WARNING^7] Player ^5%s^7 attempted to withdraw from society - ^5%s^7!'):format(source, society.name))
	--end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount, "Society Withdraw")
			xPlayer.showNotification(TranslateCap('have_withdrawn', ESX.Math.GroupDigits(amount)))
		else
			xPlayer.showNotification(TranslateCap('invalid_amount'))
		end
	end)
end)

RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function(societyName, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to non-existing society - ^5%s^7!'):format(source, societyName))
		return
	end
	amount = ESX.Math.Round(tonumber(amount))

	--if (xPlayer.job.name ~= society.name) or (xPlayer.job2.name ~= society.name) then
	--	return print(('[^3WARNING^7] Player ^5%s^7 attempted to deposit to society - ^5%s^7!'):format(source, society.name))
	--end
	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount, "Society Deposit")
			xPlayer.showNotification(TranslateCap('have_deposited', ESX.Math.GroupDigits(amount)))
			account.addMoney(amount)
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

RegisterServerEvent('esx_society:washMoney')
AddEventHandler('esx_society:washMoney', function(society, amount)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	--if (xPlayer.job.name ~= society.name) or (xPlayer.job2.name ~= society.name) then
	--	return print(('[^3WARNING^7] Player ^5%s^7 attempted to wash money in society - ^5%s^7!'):format(source, society))
	--end
	if amount and amount > 0 and account.money >= amount then
		xPlayer.removeAccountMoney('black_money', amount, "Washing")

		MySQL.insert('INSERT INTO society_moneywash (identifier, society, amount) VALUES (?, ?, ?)', {xPlayer.identifier, society, amount},
		function(rowsChanged)
			xPlayer.showNotification(TranslateCap('you_have', ESX.Math.GroupDigits(amount)))
		end)
	else
		xPlayer.showNotification(TranslateCap('invalid_amount'))
	end
end)

RegisterServerEvent('esx_society:putVehicleInGarage')
AddEventHandler('esx_society:putVehicleInGarage', function(societyName, vehicle)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to put vehicle in non-existing society garage - ^5%s^7!'):format(source, societyName))
		return
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		table.insert(garage, vehicle)
		store.set('garage', garage)
	end)
end)

RegisterServerEvent('esx_society:removeVehicleFromGarage')
AddEventHandler('esx_society:removeVehicleFromGarage', function(societyName, vehicle)
	local source = source
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to remove vehicle from non-existing society garage - ^5%s^7!'):format(source, societyName))
		return
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}

		for i=1, #garage, 1 do
			if garage[i].plate == vehicle.plate then
				table.remove(garage, i)
				break
			end
		end

		store.set('garage', garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:getSocietyMoney', function(source, cb, societyName)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to get money from non-existing society - ^5%s^7!'):format(source, societyName))
		return cb(0)
	end
	if not society then
		return cb(0)
	end
	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		cb(account.money or 0)
	end)
end)

ESX.RegisterServerCallback('esx_society:getEmployees', function(source, cb, society)
	local employees, selected = {}, Jobs[society] and 'job' or Jobs2[society] and 'job2' or 'job'

	local xPlayers = ESX.GetExtendedPlayers(selected, society)
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]

		local name = xPlayer.name
		if Config.EnableESXIdentity and name == GetPlayerName(xPlayer.source) then
			name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
		end

		employees[#employees+1] = {
			name = name,
			identifier = xPlayer.identifier,
			[selected] = {
				name = society,
				label = xPlayer[selected].label,
				grade = xPlayer[selected].grade,
				grade_name = xPlayer[selected].grade_name,
				grade_label = xPlayer[selected].grade_label
			}
		}
	end
		
	local query = selected == 'job' and "SELECT identifier, job_grade FROM `users` WHERE `job`= ? ORDER BY job_grade DESC" or selected == 'job2' and "SELECT identifier, job2_grade FROM `users` WHERE `job2`= ? ORDER BY job2_grade DESC"

	if Config.EnableESXIdentity then
		query = selected == 'job' and "SELECT identifier, job_grade, firstname, lastname FROM `users` WHERE `job`= ? ORDER BY job_grade DESC" or selected == 'job2' and "SELECT identifier, job2_grade, firstname, lastname FROM `users` WHERE `job2`= ? ORDER BY job2_grade DESC"
	end

	MySQL.query(query, {society},
	function(result)
		for k, row in pairs(result) do
			local alreadyInTable
			local identifier = row.identifier

			for k, v in pairs(employees) do
				if v.identifier == identifier then
					alreadyInTable = true
				end
			end

			if not alreadyInTable then
				local name = "Name not found." -- maybe this should be a locale instead ¯\_(ツ)_/¯

				if Config.EnableESXIdentity then
					name = row.firstname .. ' ' .. row.lastname 
				end

				local Selected = selected == 'job2' and Jobs2 or selected == 'job' and Jobs
				local gradeSelected = selected == 'job2' and 'job2_grade' or selected == 'job' and 'job_grade'

				employees[#employees+1] = {
					name = name,
					identifier = identifier,
					[selected] = {
						name = society,
						label = Selected[society].label,
						grade = row[gradeSelected],
						grade_name = Selected[society].grades[tostring(row[gradeSelected])].name,
						grade_label = Selected[society].grades[tostring(row[gradeSelected])].label
					}
				}
			end
		end

		cb(employees)
	end)

end)

ESX.RegisterServerCallback('esx_society:getJob', function(source, cb, society)
	if not Jobs[society] then
		return cb(false)
	end

	local job = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job.grades = grades

	cb(job)
end)

ESX.RegisterServerCallback('esx_society:setJob', function(source, cb, identifier, job, grade, actionType)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss'
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)

	if not isBoss then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob for Player ^5%s^7!'):format(source, xTarget.source))
		return cb()
	end

	if not xTarget then
		MySQL.update('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {job, grade, identifier},
		function()
			cb()
		end)
		return
	end

	xTarget.setJob(job, grade)

	if actionType == 'hire' then
		xTarget.showNotification(TranslateCap('you_have_been_hired', job))
		xPlayer.showNotification(TranslateCap("you_have_hired", xTarget.getName()))
	elseif actionType == 'promote' then
		xTarget.showNotification(TranslateCap('you_have_been_promoted'))
		xPlayer.showNotification(TranslateCap("you_have_promoted", xTarget.getName(), xTarget.getJob().label))
	elseif actionType == 'fire' then
		xTarget.showNotification(TranslateCap('you_have_been_fired', xTarget.getJob().label))
		xPlayer.showNotification(TranslateCap("you_have_fired", xTarget.getName()))
	end

	cb()
end)


ESX.RegisterServerCallback('esx_society:setJobSalary', function(source, cb, job, grade, salary)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' then
		if salary <= Config.MaxSalary then
			MySQL.update('UPDATE job_grades SET salary = ? WHERE job_name = ? AND grade = ?', {salary, job, grade},
			function(rowsChanged)
				Jobs[job].grades[tostring(grade)].salary = salary
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job', job)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job.grade == grade then
						xTarget.setJob(job, grade)
					end
				end
				cb()
			end)
		else
			print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary over the config limit for ^5%s^7!'):format(source, job))
			cb()
		end
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobSalary for ^5%s^7!'):format(source, job))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:setJobLabel', function(source, cb, job, grade, label)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' then
			MySQL.update('UPDATE job_grades SET label = ? WHERE job_name = ? AND grade = ?', {label, job, grade},
			function(rowsChanged)
				Jobs[job].grades[tostring(grade)].label = label
				ESX.RefreshJobs()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job', job)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job.grade == grade then
						xTarget.setJob(job, grade)
					end
				end
				cb()
			end)
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJobLabel for ^5%s^7!'):format(source, job))
		cb()
	end
end)

local getOnlinePlayers, onlinePlayers = false, {}
ESX.RegisterServerCallback('esx_society:getOnlinePlayers', function(source, cb)
	if getOnlinePlayers == false and next(onlinePlayers) == nil then -- Prevent multiple xPlayer loops from running in quick succession
		getOnlinePlayers, onlinePlayers = true, {}
		
		local xPlayers = ESX.GetExtendedPlayers()
		for i=1, #(xPlayers) do 
			local xPlayer = xPlayers[i]
			table.insert(onlinePlayers, {
				source = xPlayer.source,
				identifier = xPlayer.identifier,
				name = xPlayer.name,
				job = xPlayer.job,
				job2 = xPlayer.job2
			})
		end
		cb(onlinePlayers)
		getOnlinePlayers = false
		Wait(1000) -- For the next second any extra requests will receive the cached list
		onlinePlayers = {}
		return
	end
	while getOnlinePlayers do Wait(0) end -- Wait for the xPlayer loop to finish
	cb(onlinePlayers)
end)

ESX.RegisterServerCallback('esx_society:getVehiclesInGarage', function(source, cb, societyName)
	local society = GetSociety(societyName)
	if not society then
		print(('[^3WARNING^7] Attempting To get a non-existing society - %s!'):format(societyName))
		return
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		cb(garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:isBoss', function(source, cb, job)
	cb(isPlayerBoss(source, job))
end)

function isPlayerBoss(playerId, arg)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local selected = xPlayer.job.name == arg and 'job' or xPlayer.job2.name == arg and 'job2' or false
	if selected and xPlayer[selected].grade_name == 'boss' then
		return true, selected
	else
		print(('esx_society: %s attempted open a society boss menu!'):format(xPlayer.identifier))
		return false
	end
end

function WashMoneyCRON(d, h, m)
	MySQL.query('SELECT * FROM society_moneywash', function(result)
		for i=1, #result, 1 do
			local society = GetSociety(result[i].society)
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)

			-- add society money
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				account.addMoney(result[i].amount)
			end)

			-- send notification if player is online
			if xPlayer then
				xPlayer.showNotification(TranslateCap('you_have_laundered', ESX.Math.GroupDigits(result[i].amount)))
			end

		end
		MySQL.update('DELETE FROM society_moneywash')
	end)
end

TriggerEvent('cron:runAt', 3, 0, WashMoneyCRON)

ESX.RegisterServerCallback('esx_society:getJob2', function(source, cb, society)
	if not Jobs2[society] then
		return cb(false)
	end

	local job2 = json.decode(json.encode(Jobs2[society]))
	local grades = {}

	for k,v in pairs(job2.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job2.grades = grades

	cb(job2)
end)

ESX.RegisterServerCallback('esx_society:setJob2', function(source, cb, identifier, job2, grade, actionType)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job2.grade_name == 'boss'
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)

	if not isBoss then
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob2 for Player ^5%s^7!'):format(source, xTarget.source))
		return cb()
	end

	if not xTarget then
		MySQL.update('UPDATE users SET job2 = ?, job2_grade = ? WHERE identifier = ?', {job2, grade, identifier},
		function()
			cb()
		end)
		return
	end

	xTarget.setJob2(job2, grade)

	if actionType == 'hire' then
		xTarget.showNotification(TranslateCap('you_have_been_hired', job2))
		xPlayer.showNotification(TranslateCap("you_have_hired", xTarget.getName()))
	elseif actionType == 'promote' then
		xTarget.showNotification(TranslateCap('you_have_been_promoted'))
		xPlayer.showNotification(TranslateCap("you_have_promoted", xTarget.getName(), xTarget.getJob2().label))
	elseif actionType == 'fire' then
		xTarget.showNotification(TranslateCap('you_have_been_fired', xTarget.getJob2().label))
		xPlayer.showNotification(TranslateCap("you_have_fired", xTarget.getName()))
	end

	cb()
end)

ESX.RegisterServerCallback('esx_society:setJob2Salary', function(source, cb, job2, grade, salary)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job2.name == job2 and xPlayer.job2.grade_name == 'boss' then
		if salary <= Config.MaxSalary then
			MySQL.update('UPDATE job2_grades SET salary = ? WHERE job2_name = ? AND grade = ?', {salary, job2, grade},
			function(rowsChanged)
				Jobs2[job2].grades[tostring(grade)].salary = salary
				ESX.RefreshJobs2()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job2', job2)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job2.grade == grade then
						xTarget.setJob2(job2, grade)
					end
				end
				cb()
			end)
		else
			print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob2Salary over the config limit for ^5%s^7!'):format(source, job2))
			cb()
		end
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob2Salary for ^5%s^7!'):format(source, job2))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:setJob2Label', function(source, cb, job2, grade, label)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job2.name == job2 and xPlayer.job2.grade_name == 'boss' then
			MySQL.update('UPDATE job2_grades SET label = ? WHERE job2_name = ? AND grade = ?', {label, job2, grade},
			function(rowsChanged)
				Jobs2[job2].grades[tostring(grade)].label = label
				ESX.RefreshJobs2()
				Wait(1)
				local xPlayers = ESX.GetExtendedPlayers('job2', job2)
				for _, xTarget in pairs(xPlayers) do

					if xTarget.job2.grade == grade then
						xTarget.setJob2(job2, grade)
					end
				end
				cb()
			end)
	else
		print(('[^3WARNING^7] Player ^5%s^7 attempted to setJob2Label for ^5%s^7!'):format(source, job2))
		cb()
	end
end)