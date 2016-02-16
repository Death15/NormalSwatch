local function run(msg, matches)
if not is_sudo(msg) then
return "for Sudo Only"
end

if matches[1] == "setlang" then
local hash_per = 'persian:enabled:'..msg.to.id
local perenabled = redis:get(hash_per)
if matches[2] == "per" then
  return "زبان گروه به فارسی تغیر کرد"
  redis:set(hash_per, true)
end

local hash_en = 'english:enabled:'..msg.to.id
local enenabled = redis:get(hash_en)
if matches[2] == "en" then
  return "Group Language Has been set to : <English>"
redis:set(hash_en, true)
end

if not hash_per then
  redis:get(hash_en, true)
end 
end

return {
  petterns = {
    "^/(setlang) (.*)$"
    },
  run = run
}

end
