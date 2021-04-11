ESX = nil
local KeyToucheCloseEvent = {
    { code = 172, event = 'ArrowUp' },
    { code = 173, event = 'ArrowDown' },
    { code = 174, event = 'ArrowLeft' },
    { code = 175, event = 'ArrowRight' },
    { code = 191, event = 'Enter' },
    { code = 194, event = 'Backspace' },
  }
  
  local KeyOpenClose = 288 -- F1
  local KeyTakeCall = 38 -- E
  local menuIsOpen = false
  local contacts = {}
  local messages = {}
  local myPhoneNumber = ''
  local isDead = false
  local USE_RTC = false
  local useMouse = false
  local ignoreFocus = false
  local takePhoto = false
  local hasFocus = false
  
  local PhoneInCall = {}
  local currentPlaySound = false
  local soundDistanceMax = 8.0
  local TokoVoipID = nil
  local telType = "white_phone"
  local test = ""
  local toghud = false
  local tokovoipstate = 1
 local isTalking = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)


    
Citizen.CreateThread(function()
    while true do   
        Citizen.Wait(0)

        if IsControlJustPressed(1, 288) then

            togglePhone()
        end
    end

end)

function togglePhone()
    if toghud == true then 
        toghud = false
    else
        toghud = true
    end
    SetNuiFocus(toghud, toghud)
    SendNUIMessage({
        action = "hud",
        show = toghud
    })
end



RegisterNetEvent('utk_laptop:client:data_transceiver')
AddEventHandler('utk_laptop:client:data_transceiver', function(data)
    print("data : "..data.hex)
    SetNuiFocus(toghud, toghud)
    SendNUIMessage({
        action = "hud",
        show = toghud,
        hex = data.hex
    })
end)

 

RegisterNetEvent('utkphone:client:get_phone_number')
AddEventHandler('utkphone:client:get_phone_number', function(data)
    print("Gelen Data : "..data.telefon)
    myPhoneNumber = data.telefon
end)


-- Configuration

  

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

RegisterCommand('arama', function(source, args, rawCommand)
    local _source = source
    local arama_id = 110915
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    exports.tokovoip_script:setPlayerData(playerName, "call:channel", arama_id + 110915, true)
    TokoVoipID = exports.tokovoip_script:getPlayerData(playerName, "call:channel")
    exports.tokovoip_script:addPlayerToRadio(arama_id + 110915)
	print(getPlayerRadioChannel)
end)

RegisterCommand('aramabitir', function(source, args, rawCommand)
    local _source = source
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    exports.tokovoip_script:setPlayerData(playerName, "call:channel", "nil", true)
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "call:channel")
    exports.tokovoip_script:removePlayerFromRadio(TokoVoipID)
    TokoVoipID = nil
	print(getPlayerRadioChannel)
end)


RegisterCommand('aramaid', function(source, args, rawCommand)
    local _source = source
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "call:channel")
	print(getPlayerRadioChannel)
end)

RegisterCommand('fotocek', function(source, args, rawCommand)

    CreateMobilePhone(1)
    CellCamActivate(true, true)
    takePhoto = true
    Citizen.Wait(0)
    if hasFocus == true then
      SetNuiFocus(false, false)
      hasFocus = false
    end
      while takePhoto do
      Citizen.Wait(0)
      if IsControlJustPressed(1, 27) then -- Toogle Mode
         frontCam = not frontCam
         CellFrontCamActivate(frontCam)
      elseif IsControlJustPressed(1, 177) then -- CANCEL
        DestroyMobilePhone()
        CellCamActivate(false, false)
        cb(json.encode({ url = nil }))
        takePhoto = false
        break
      elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
              exports['screenshot-basic']:requestScreenshotUpload('http://127.0.0.1/upload/upload.php', 'files[]', function(data)
          local resp = json.decode(data)
          DestroyMobilePhone()
          CellCamActivate(false, false)
          print(resp.files[1].url)
          SendNUIMessage({
            action = "twitter_post",
            value = resp.files[1].url
        })

        end)
        takePhoto = false
          end
          HideHudComponentThisFrame(7)
          HideHudComponentThisFrame(8)
          HideHudComponentThisFrame(9)
          HideHudComponentThisFrame(6)
          HideHudComponentThisFrame(19)
      HideHudAndRadarThisFrame()
    end
    Citizen.Wait(1000)
    PhonePlayAnim('text', false, true)
  
end)


RegisterNUICallback('kapat', function(data, cb)
    togglePhone()
end)





RegisterNUICallback('TwitterFoto', function(data, cb)

    CreateMobilePhone(1)
    CellCamActivate(true, true)
    takePhoto = true
    Citizen.Wait(0)
    SetNuiFocus(false, false)
    if hasFocus == true then
      SetNuiFocus(false, false)
      hasFocus = false
    end
      while takePhoto do
      Citizen.Wait(0)
      if IsControlJustPressed(1, 27) then -- Toogle Mode
         frontCam = not frontCam
         CellFrontCamActivate(frontCam)
      elseif IsControlJustPressed(1, 177) then -- CANCEL
        DestroyMobilePhone()
        CellCamActivate(false, false)
        cb(json.encode({ url = nil }))
        takePhoto = false
        break
      elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
          exports['screenshot-basic']:requestScreenshotUpload('http://127.0.0.1/upload/upload.php', 'files[]', function(data)
          local resp = json.decode(data)
          DestroyMobilePhone()
          CellCamActivate(false, false)
          print(resp.files[1].url)
          SendNUIMessage({
            action = "twitter_post",
            value = resp.files[1].url
        })

        end)
        takePhoto = false
          end
          HideHudComponentThisFrame(7)
          HideHudComponentThisFrame(8)
          HideHudComponentThisFrame(9)
          HideHudComponentThisFrame(6)
          HideHudComponentThisFrame(19)
      HideHudAndRadarThisFrame()
    end
    Citizen.Wait(1000)
    PhonePlayAnim('text', false, true)
 
end)



RegisterCommand('hud', function(source, args, rawCommand)
    if toghud then 
        toghud = false
    else
        toghud = true
    end
    TriggerServerEvent("utk_laptop:datastore", source);
end)
 
 
