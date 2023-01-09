
-- Optional commande /co for get the coordinates in raw in the console

--RegisterCommand("co", function(source, agrs, rawcommand)
--    local ped = PlayerPedId()
--    pos = GetEntityCoords(ped)
--    print(pos.x..", "..pos.y..", "..pos.z-0.20)
--    positiondujoueur = (pos.x..", "..pos.y..", "..pos.z-0.20)
--    TriggerServerEvent("printco")
--end,false)

-- Blips --
Citizen.CreateThread(function()
    if Config.Blips.Afficher then
        for k,v in pairs(Config.position.pos) do
            local superette = AddBlipForCoord(v)
            SetBlipSprite(superette, 59)
            SetBlipScale(superette, 0.8)
            SetBlipColour(superette, 2)
            SetBlipAsShortRange(superette, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Superette")
            EndTextCommandSetBlipName(superette)
        end
    end
end)

RMenu.Add("Dsupershop", "Dsupershop_main", RageUI.CreateMenu(nil,"24/7 SuperMarket"))
RMenu:Get("Dsupershop", "Dsupershop_main").Closed = function()end

RMenu.Add("Dsupershop", "Dsupershop_food", RageUI.CreateSubMenu(RMenu:Get("Dsupershop", "Dsupershop_main"), nil,"24/7 SuperMarket"))
RMenu:Get("Dsupershop", "Dsupershop_food").Closed = function()end

RMenu.Add("Dsupershop", "Dsupershop_divers", RageUI.CreateSubMenu(RMenu:Get("Dsupershop", "Dsupershop_main"), nil,"24/7 SuperMarket"))
RMenu:Get("Dsupershop", "Dsupershop_divers").Closed = function()end

RMenu.Add("Dsupershop", "Dsupershop_drink", RageUI.CreateSubMenu(RMenu:Get("Dsupershop", "Dsupershop_main"), nil,"24/7 SuperMarket"))
RMenu:Get("Dsupershop", "Dsupershop_drink").Closed = function()end


Citizen.CreateThread(function()
    while true do
        local interval = 1200
        rageinterval = 1200
        local position = Config.position.pos
        for k,v in pairs(position) do
        local playerPos = GetEntityCoords(PlayerPedId())
        local distance = #(playerPos - v)

        if distance <= 4 then
            interval = 3
            rageinterval = 3
            DrawMarker(29, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
            if distance < 1 then
                RageUI.Text({message = "Appuyez sur ~g~[E]~s~ pour ouvrir le menu", time_display = 1})
                if IsControlJustPressed(1, 51) then
                   RageUI.Visible(RMenu:Get("Dsupershop", "Dsupershop_main"), true)
                end
            end
        end
    end
        
        Citizen.Wait(interval)
    end
end)
--DrawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)

Citizen.CreateThread(function()
    while true do

        RageUI.IsVisible(RMenu:Get("Dsupershop", "Dsupershop_main"),true,true,true,function()
            
            RageUI.Line()

            RageUI.ButtonWithStyle("Nouriture", nil, {RightLabel = "→→"}, true,function(h,a,s)
            end, RMenu:Get("Dsupershop", "Dsupershop_food"))

            RageUI.ButtonWithStyle("Boissons", nil, {RightLabel = "→→"}, true,function(h,a,s)
            end, RMenu:Get("Dsupershop", "Dsupershop_drink"))

            RageUI.ButtonWithStyle("Divers", nil, {RightLabel = "→→"}, true,function(h,a,s)
            end, RMenu:Get("Dsupershop", "Dsupershop_divers"))

            RageUI.Line()

        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("Dsupershop","Dsupershop_food"),true,true,true,function()
            for k,v in pairs(Config.food) do

            RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "~g~"..v.price..Config.money.unit}, true,function(h,a,s)
                if s then
                    TriggerServerEvent("dsupershop:buy", v.nom, v.price, v.label, v.ammount)
                end
            end, RMenu:Get("Dsupershop", "Dsupershop_food"))
            end
            
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("Dsupershop","Dsupershop_drink"),true,true,true,function()
            for k,v in pairs(Config.drink) do

            RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "~g~"..v.price..Config.money.unit}, true,function(h,a,s)
                if s then
                    TriggerServerEvent("dsupershop:buy", v.nom, v.price, v.label, v.ammount)
                end
            end, RMenu:Get("Dsupershop", "Dsupershop_drink"))
            end
            
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("Dsupershop","Dsupershop_divers"),true,true,true,function()
            for k,v in pairs(Config.divers) do

            RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "~g~"..v.price..Config.money.unit}, true,function(h,a,s)
                if s then
                    TriggerServerEvent("dsupershop:buy", v.nom, v.price, v.label, v.ammount)
                end
            end, RMenu:Get("Dsupershop", "Dsupershop_divers"))
            end
            
        end, function()end, 1)

        Citizen.Wait(rageinterval)
    end
end)

-- [CREDITS] --
print("[MADE BY ^2DixLan#3750^0]")
-- Ne vous appropriez pas des valeurs ne vous appartenant pas !
-- [ARTICLE DE LOIS SUISSE] Le vol simple est passible d'une peine privative de liberté de cinq ans au plus ou d'une peine pécuniaire (art. 139 ch. 1 CP)

-- [ARTICLE DE LOIS FRANCAISE] Le vol est puni de trois ans d'emprisonnement et de 45 000 euros d'amende. (art. 311-3 ch. 1 CP)

-- [ARTICLE DE LOIS FRANCAISE] Lorsque le vol prévu à l'article 311-3 porte sur une chose dont la valeur est inférieure ou égale à 300 euros
-- et qu'il apparaît au moment de la constatation de l'infraction que cette chose a été restituée à la victime ou que celle-ci a été indemnisée de son préjudice, 
-- l'action publique peut être éteinte, y compris en cas de récidive, dans les conditions prévues aux articles 495-17 à 495-25 du code de procédure pénale, 
-- par le versement d'une amende forfaitaire d'un montant de 300 euros. Le montant de l'amende forfaitaire minorée est de 250 euros et le montant de l'amende 
-- forfaitaire majorée est de 600 euros. (art. 311-3-1 ch. 1 CP)