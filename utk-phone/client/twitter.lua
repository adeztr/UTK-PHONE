RegisterNUICallback('twitterSendPost', function(data, cb)
    TriggerServerEvent("utkphone:twitterSender", data);
end)