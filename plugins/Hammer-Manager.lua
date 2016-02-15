
do

local function run(msg, matches)
if not is_sudo(msg) then
 return nil
 end

 if msg.to.type == 'channel'then
 if matches[1] == "kick" then
Channel = 'channel#'..msg.to.id
user = 'user#'..matches[2]
 channel_kick_user(Channel, user, ok_cb, true)
 end

if matches[1] == "invite" then
Channel = 'channel#'..msg.to.id
user = 'user#'..matches[2]
channel_invite_user(Channel, user, ok_cb, true)
 end
 end
 
 return {
 description = "Member Controller plugin!",
 usage = {
  "/kick <UserID> : kick somone from supergroup",
  "/invite <UserID> : invite user to supergroup"
  },
 patterns = {
 "^/(kick) (%d+)$",
 "^/(invite) (%d+)$"
 },
 run = run
}

end
