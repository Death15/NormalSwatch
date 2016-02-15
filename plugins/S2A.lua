local function run(msg, matches)
	if matches[1] == 'send' and is_admin(msg) then
		local response = matches[3]
		send_large_msg("chat#id"..matches[2], response)
	end
	if matches[1] == 's2a' then
		if is_sudo(msg) then -- Only sudo !
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local receiver = 'chat#id'..chat_id
				send_large_msg(receiver, response)
			end
		end
end

	if matches[1] == 's2avip' then
		if is_sudo(msg) then -- Only sudo !
			local data = load_data(_config.moderation.data)
			local vips = 'vips'
			local response = matches[2]
			for k,v in pairs(data[tostring(vips)]) do
				chat_id =  v
				local receiver = 'chat#id'..chat_id
				send_large_msg(receiver, response)
			end
		end
		
end
return {
  patterns = {
    "^[!/]([Ss]2[Aa]) +(.+)$",
    "^[!/](send) (%d+) (.*)$",
    "^[!/]([Ss]2[Aa]vip) +(.+)$"
  },
  run = run
}
