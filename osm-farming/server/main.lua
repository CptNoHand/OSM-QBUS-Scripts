-- SCRIPT DEVELOPED BY OSMIUM | OSMFX | DISCORD.IO/OSMFX --
local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local playersProcessingCannabis = {}

RegisterServerEvent('osm-farming:pickedUpCannabis')
AddEventHandler('osm-farming:pickedUpCannabis', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	  if TriggerClientEvent("QBCore:Notify", src, "Maiskolben gepflückt!!", "Success", 3000) then
		  Player.Functions.AddItem('corn_kernel', Config.CornOutput) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['corn_kernel'], "add")
	  end
end)

RegisterServerEvent('osm-farming:GivePlayerBox')
AddEventHandler('osm-farming:GivePlayerBox', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem('box', 2) ---- change this shit 
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['box'], "add")

end)

RegisterServerEvent("osm-farming:server:SellFarmingItems")
AddEventHandler("osm-farming:server:SellFarmingItems", function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Config.ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (Config.ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-farm-items")
        TriggerClientEvent('QBCore:Notify', src, "Verkauft für"..price)
    end
end)

RegisterServerEvent('osm-farming:CowMilked')
AddEventHandler('osm-farming:CowMilked', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	  if TriggerClientEvent("QBCore:Notify", src, "Du hast Milch bekommen!", "Success", 2000) then
		  Player.Functions.AddItem('milk', math.random(1, 3))----change this
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk'], "add")
	  end
	  
	  local chance = math.random(1, 100)
	  if chance < 3 then
		  Player.Functions.AddItem("weed_nutrition", 1, false)
		  TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weed_nutrition"], "add")
	  end
end)

RegisterServerEvent('osm-farming:ProcessCorn')
AddEventHandler('osm-farming:ProcessCorn', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)

		local item = Player.Functions.GetItemByName('corn_kernel')
		if item ~= nil then 
			if item.amount > 4 then 
				Player.Functions.RemoveItem('corn_kernel', 4)----change this
				Player.Functions.RemoveItem('box', 1)----change this
				Player.Functions.AddItem('corn_packet', 1)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['corn_kernel'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['corn_packet'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'Du hast ein Maispaket hergestellt!', "success")   
			else 
				TriggerClientEvent('QBCore:Notify', src, 'Du benötigst 4 Maiskolben!', "success")   
			end     
		else    
			TriggerClientEvent('QBCore:Notify', src, 'Du benötigst 4 Maiskolben!', "success")   
		end                                                                				
end)

RegisterServerEvent('osm-farming:ProcessOranges')
AddEventHandler('osm-farming:ProcessOranges', function()
	print('wow')
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)

		local item = Player.Functions.GetItemByName('orange')
		if item ~= nil then 
			if item.amount > 10 then 
				Player.Functions.RemoveItem('orange', math.random(5,10))----change this
				Player.Functions.RemoveItem('box', 1)----change this
				Player.Functions.AddItem('fruit_pack', 1)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['fruit_pack'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'Du hast ein Fruchtkorb hergestellt!', "success")   
			else 
				TriggerClientEvent('QBCore:Notify', src, 'Du benötigst 10 Orangen!', "success")   
			end     
		else    
			TriggerClientEvent('QBCore:Notify', src, 'Du benötigst 10 Orangen!', "success")   
		end                                                                				
end)

RegisterServerEvent('osm-farming:ProcessMilk')
AddEventHandler('osm-farming:ProcessMilk', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)

		local item = Player.Functions.GetItemByName('milk')
		if item ~= nil then 
			if item.amount > 5 then 
				Player.Functions.RemoveItem('milk', math.random(2,5))----change this
				Player.Functions.RemoveItem('box', 1)----change this
				Player.Functions.AddItem('milk_pack', 1)----change this
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk'], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk_pack'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'Du hast ein Milch Karton hergestellt!', "success")   
			else 
				TriggerClientEvent('QBCore:Notify', src, 'Du benötigst 5 Milch!!', "success")   
			end     
		else    
			TriggerClientEvent('QBCore:Notify', src, 'Du benötigst 5 Milch!', "success")   
		end                                                                				
end)

RegisterServerEvent('osm-farming:server:SpawnTractor')
AddEventHandler('osm-farming:server:SpawnTractor', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
		local cashamount = Player.PlayerData.money["cash"]

		if cashamount >= Config.TractorRent then
			Player.Functions.RemoveMoney('cash', Config.TractorRent) 
			TriggerClientEvent('SpawnTractor', src)
		else
			TriggerClientEvent('QBCore:Notify', src, 'Du brauchst $'..Config.TractorRent..' um den Traktor zu leihen', "success")   
		end
end)

RegisterServerEvent('osm-farming:GiveOranges')
AddEventHandler('osm-farming:GiveOranges', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
		Player.Functions.AddItem('orange', math.random(1, 4))----change this
		TriggerClientEvent('QBCore:Notify', src, 'Du hast Orangen vom Baum gepflückt!', "success")                                                                         				
end)

RegisterServerEvent('Server:UnRentTractor')
AddEventHandler('Server:UnRentTractor', function()
		local src = source
    	local Player = QBCore.Functions.GetPlayer(src)
		-- Player.Functions.RemoveMoney('bank', 1500, 'tractor')
		TriggerClientEvent('UnRentTractor', src)
end)

function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end

RegisterServerEvent('osm-farming:cancelProcessing')
AddEventHandler('osm-farming:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('osm-farming:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('osm-farming:onPlayerDeath')
AddEventHandler('osm-farming:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

QBCore.Functions.CreateCallback('osm-farming:server:GetSellingPrice', function(source, cb)
    local retval = 5
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Config.ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    retval = retval + (Config.ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                end
            end
        end
    end
    cb(retval)
end)
