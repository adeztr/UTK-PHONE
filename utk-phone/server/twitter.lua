RegisterNetEvent("utkphone:twitterSender")
AddEventHandler('utkphone:twitterSender', function(data, user)
    MySQL.Async.fetchAll("INSERT INTO utk_twitter_tweets (`user`, `message`, `image`, `visibility`) VALUES(@user, @message, @image, @visibility);", {["@user"] = user.id, ["@message"] = data.message, ["@image"] = data.image, ["@visibility"] = data.visibility}, function()
 
    end)
end)