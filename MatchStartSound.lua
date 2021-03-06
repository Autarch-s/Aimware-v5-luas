----    Base    code    for    auto    updating.
--
--local    cS    =    GetScriptName()
--local    cV    =    '1.0.0'
--local    gS    =    'PUT    LINK    TO    RAW    LUA    SCRIPT'
--local    gV    =    'PUT    LINK    TO    RAW    VERSION'
--
--local    function    AutoUpdate()
--	if    gui.GetValue('lua_allow_http')    and    gui.GetValue('lua_allow_cfg')    then
--		local    nV    =    http.Get(gV)
--		if    cV    ~=    nV    then
--			local    nF    =    http.Get(gS)
--			local    cF    =    file.Open(cS,    'w')
--			cF:Write(nF)
--			cF:Close()
--			print(cS,    'updated    from',    cV,    'to',    nV)
--		else
--			print(cS,    'is    up-to-date.')
--		end
--	end
--end		
--
--callbacks.Register('Draw',    'Auto    Update')
--callbacks.Unregister('Draw',    'Auto    Update')



local Enabled = gui.Checkbox(gui.Reference("Visuals", "World", "Extra"), "vis.sounds.pnks", "PNKS! Round Start Sound", false)
Enabled:SetDescription("Plays the PNKS! Match start sound.")
client.AllowListener("round_announce_match_start");
local function EventHook(pEvent)
    if Enabled:GetValue() then
        if pEvent:GetName() == "round_announce_match_start" then
            client.Command("play superyu\\hey_ho_lets_go.mp3", true);
        end
    end
end
callbacks.Register("FireGameEvent", EventHook);