local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end

local function run(msg)
  if msg.service and msg.action.type == 'chat_add_user' then
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)] then
      return "User Who Invited Me has been blocked"
      chat_del_user('chat#id'..msg.to.id, 'user#id'..14966147, callback, false)
      end
end

return {
  description = "Kicking ourself (bot) from unmanaged groups.",
  usage = "Plugin For Kiling add with id ....",
  patterns = {
    "^!!tgservice
