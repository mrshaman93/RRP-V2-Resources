RegisterNetEvent('qb-phone:server:sendVehicleRequest', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Asshole = tonumber(data.id)
    local OtherAsshole = QBCore.Functions.GetPlayer(Asshole)

    if not OtherAsshole then return TriggerClientEvent("QBCore:Notify", src, 'State ID does not exist!', "error") end
    if not data.price or not data.plate then return end
    if Player.PlayerData.citizenid == OtherAsshole.PlayerData.citizenid then return TriggerClientEvent("QBCore:Notify", src, 'You cannot sell a vehicle to yourself!', "error") end

    TriggerClientEvent('qb-phone:client:sendVehicleRequest', Asshole, data, Player)
end)

RegisterNetEvent('qb-phone:server:sellVehicle', function(data, Seller, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local SellerData = QBCore.Functions.GetPlayerByCitizenId(Seller.PlayerData.citizenid)

    if type == 'accepted' then
        if Player.PlayerData.money.bank and Player.PlayerData.money.bank >= tonumber(data.price) then
            Player.Functions.RemoveMoney('bank', data.price, "Bought Used Vehicle")
            SellerData.Functions.AddMoney('bank', data.price, "Sold Used Vehicle")
            TriggerClientEvent('qb-phone:client:CustomNotification', src, "VEHICLE SALE", "You purchased the vehicle for $"..data.price, "fas fa-chart-line", "#D3B300", 5500)
            TriggerClientEvent('qb-phone:client:CustomNotification', Seller.PlayerData.source, "VEHICLE SALE", "Your vehicle was successfully purchased!", "fas fa-chart-line", "#D3B300", 5500)
            MySQL.update('UPDATE player_vehicles SET citizenid = ?, garage_id = ?, state = ? WHERE plate = ?',{Player.PlayerData.citizenid, Config.SellGarage, 1, data.plate})
            -- Update Garages
            TriggerClientEvent('qb-phone:client:updateGarages', src)
            TriggerClientEvent('qb-phone:client:updateGarages', Seller.PlayerData.source)
        else
            TriggerClientEvent('qb-phone:client:CustomNotification', src, "VEHICLE SALE", "Insufficient Funds", "fas fa-chart-line", "#D3B300", 5500)
            TriggerClientEvent('qb-phone:client:CustomNotification', Seller.PlayerData.source, "VEHICLE SALE", "Your vehicle was not purchased!", "fas fa-chart-line", "#D3B300", 5500)
        end
    elseif type == 'denied' then
        TriggerClientEvent('qb-phone:client:CustomNotification', src, "VEHICLE SALE", "Request denied", "fas fa-chart-line", "#D3B300", 5500)
        TriggerClientEvent('qb-phone:client:CustomNotification', Seller.PlayerData.source, "VEHICLE SALE", "Your sale request was denied!", "fas fa-chart-line", "#D3B300", 5500)
    end
end)

local function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

lib.callback.register('qb-phone:server:GetGarageVehicles', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Vehicles = {}
    local vehdata
    local result = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid})
    if result[1] then
        for _, v in pairs(result) do
            local VehicleData = QBCore.Shared.Vehicles[v.vehicle]
            local VehicleGarage = "None"
            local enginePercent = round(v.engine / 10, 0)
            local bodyPercent = round(v.body / 10, 0)
            if v.garage then
                if Config.Garages[v.garage] then
                    VehicleGarage = Config.Garages[v.garage]["label"]
                else
                    VehicleGarage = v.garage
                end
            end

            local VehicleState = ""
            if v.state == 0 then
                VehicleState = ""
            elseif v.state == 2 then
                VehicleState = ""
            end

            if VehicleData["brand"] then
                vehdata = {
                    fullname = VehicleData["brand"] .. " " .. VehicleData["name"],
                    brand = VehicleData["brand"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = VehicleState,
                    fuel = v.fuel,
                    engine = enginePercent,
                    body = bodyPercent,
                    paymentsleft = v.paymentsleft
                }
            else
                vehdata = {
                    fullname = VehicleData["name"],
                    brand = VehicleData["name"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = VehicleState,
                    fuel = v.fuel,
                    engine = enginePercent,
                    body = bodyPercent,
                    paymentsleft = v.paymentsleft
                }
            end
            Vehicles[#Vehicles+1] = vehdata
        end
        return Vehicles
    else
        return nil
    end
end)
