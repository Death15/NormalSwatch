local function run(msg, matches)
if msg.service and msg.action.type == "chat_add_user" then
 local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)] then
    block_user("user#id"..msg.from.id,ok_cb,false)
    end
  end
  
  return {
  patterns = {
  "^!!tgservice (.+)$
  },
  run = run
  }
  
