do

local function run(msg, matches)
  if matches[1] == "getfile" then
    local file = matches[3]
    local folder = matches[2]
    if is_sudo(msg) then
      local receiver = get_receiver(msg)
      send_document(receiver, "./"..folder.."/"..file.."", ok_cb, false)
    end
  end
end

return {
  patterns = {
  "^[!/](getfile) (.*) (.*)$"
  },
  run = run
}
end
