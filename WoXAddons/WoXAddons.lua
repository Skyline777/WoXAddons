ZoneFadeInDuration = 0.5;
ZoneHoldDuration = 1;
ZoneFadeOutDuration = 2.0;
ZonePVPType = nil;
playerFactionWoX = { UnitFactionGroup("player") }
 
function SetZoneText(showZone)
    PVPArenaTextString:SetText("");
    PVPInfoTextString:SetText("");
    local areaId = GetCurrentMapAreaID();
    local pvpTextString = PVPInfoTextString;
    if ( isSubZonePvP ) then
        pvpTextString = PVPArenaTextString;
    end
    currentLocale = GetLocale();
    currentLocaleSupported = true;
    if (currentLocale == "esES" or currentLocale == "esMX") then
        HIGHSec = "Zona SEGURA";
        LOWSec = "Zona PELIGROSA";
        NULLSec = "Zona MUY PELIGROSA";
    else
        HIGHSec = "SAFE Zone";
        LOWSec = "DANGEROUS Zone";
        NULLSec = "HIGHLY DANGEROUS Zone";
    end
	if (    playerFactionWoX[1] == "Alliance"
        and areaId == 242    -- Moonglade
         or playerFactionWoX[1] == "Alliance"
        and areaId == 28     -- Dun Morogh
         or playerFactionWoX[1] == "Alliance"
        and  areaId == 15     -- Deeprun Tram
         or playerFactionWoX[1] == "Alliance"
        and  areaId == 342    -- Iron Forge
         or playerFactionWoX[1] == "Alliance"
        and  areaId == 31     -- Elwynn Forest
         or playerFactionWoX[1] == "Alliance"
        and  areaId == 302    -- Stormwind
         or playerFactionWoX[1] == "Alliance"
        and  areaId == 42     -- Teldrassil
         or playerFactionWoX[1] == "Alliance"
        and  areaId == 382    -- Darnassus
     ) then
       pvpTextString:SetFormattedText("("..HIGHSec..")");
       pvpTextString:SetTextColor(0, 1, 0); -- Green
       ZoneTextString:SetTextColor(0, 1, 0);
       SubZoneTextString:SetTextColor(0, 1, 0);
	elseif ( playerFactionWoX[1] ~= "Alliance" -- Horde
         and areaId == 242    -- Moonglade
          or playerFactionWoX[1] ~= "Alliance"
		 and areaId == 322    -- Orgrimmar
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 10     -- Mulgore
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 363    -- Thunderbluff
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 383    -- Undercity
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 21     -- Tirisfal Glades
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 5      -- Durotar
      ) then
        pvpTextString:SetFormattedText("("..HIGHSec..")");
        pvpTextString:SetTextColor(0, 1, 0); -- Green
        ZoneTextString:SetTextColor(0, 1, 0);
        SubZoneTextString:SetTextColor(0, 1, 0);
    elseif ( areaId == 44    -- Ashenvale
          or areaId == 43    -- Dark Shore
          or areaId == 12    -- The Barrens
          or areaId == 62    -- Thousand Needles
          or areaId == 162   -- Tanaris
          or areaId == 82    -- Stonetalon Mountains
          or areaId == 38    -- Stranglethorn Vale
          or areaId == 14    -- Wailing Caverns (Barrens) // Blackfathom Deeps (Ashenvale)
      ) then
        pvpTextString:SetText("("..LOWSec..")");
        pvpTextString:SetTextColor(1, 0.6, 0.2); -- Orange
        ZoneTextString:SetTextColor(1, 0.6, 0.2);
        SubZoneTextString:SetTextColor(1, 0.6, 0.2);
    elseif ( playerFactionWoX[1] == "Alliance"
         and areaId == 102   -- Desolace
          or playerFactionWoX[1] == "Alliance"
         and areaId == 183   -- Felwood
          or playerFactionWoX[1] == "Alliance"
         and areaId == 142   -- Dustwallow Marsh
          or playerFactionWoX[1] == "Alliance"
         and areaId == 182   -- Azshara
          or playerFactionWoX[1] == "Alliance"
         and areaId == 122   -- Feralas
          or playerFactionWoX[1] == "Alliance"
         and areaId == 322   -- Orgrimmar
          or playerFactionWoX[1] == "Alliance"
         and areaId == 10    -- Mulgore
          or playerFactionWoX[1] == "Alliance"
         and areaId == 363   -- Thunderbluff
          or playerFactionWoX[1] == "Alliance"
         and areaId == 383   -- Undercity
          or playerFactionWoX[1] == "Alliance"
         and areaId == 21    -- Tirisfal Glades
          or playerFactionWoX[1] == "Alliance"
         and areaId == 5     -- Durotar
      ) then
        pvpTextString:SetFormattedText("("..NULLSec..")");
        pvpTextString:SetTextColor(1, 0, 0); -- Red
        ZoneTextString:SetTextColor(1, 0, 0);
        SubZoneTextString:SetTextColor(1, 0, 0);
	elseif ( playerFactionWoX[1] ~= "Alliance" -- Horde
         and areaId == 102   -- Desolace
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 183   -- Felwood
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 142   -- Dustwallow Marsh
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 182   -- Azshara
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 122   -- Feralas
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 28    -- Dun Morogh
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 15    -- Deeprun Tram
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 342   -- Iron Forge
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 31    -- Elwynn Forest
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 302   -- Stormwind
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 42    -- Teldrassil
          or playerFactionWoX[1] ~= "Alliance"
         and areaId == 382   -- Darnassus
	  ) then
        pvpTextString:SetFormattedText("("..NULLSec..")");
        pvpTextString:SetTextColor(1, 0, 0); -- Red
        ZoneTextString:SetTextColor(1, 0, 0);
        SubZoneTextString:SetTextColor(1, 0, 0);
    else
        ZoneTextString:SetTextColor(1, 0.9294, 0.7607); -- White
        SubZoneTextString:SetTextColor(1, 0.9294, 0.7607);
    end

end
 
function ZoneText_OnLoad(self)
    FadingFrame_OnLoad(self);
    FadingFrame_SetFadeInTime(self, ZoneFadeInDuration);
    FadingFrame_SetHoldTime(self, ZoneHoldDuration);
    FadingFrame_SetFadeOutTime(self, ZoneFadeOutDuration);
    self:RegisterEvent("ZONE_CHANGED");
    self:RegisterEvent("ZONE_CHANGED_INDOORS");
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA");
    self.zoneText = "";
    ZonePVPType = nil;
end
 
function ZoneText_OnEvent(self, event, ...)
	local showZoneText = false;	
	local zoneText = GetZoneText();
	if ( (zoneText ~= self.zoneText) or (event == "ZONE_CHANGED_NEW_AREA") ) then
		self.zoneText = zoneText;
		ZoneTextString:SetText( zoneText );
		showZoneText = true;
		SetZoneText( showZoneText );
		FadingFrame_Show( self );
	end
	
	local subzoneText = GetSubZoneText();
	if ( subzoneText == "" and not showZoneText) then
		subzoneText = zoneText;
	end
	SubZoneTextString:SetText( "" );

	if ( subzoneText == zoneText ) then
		showZoneText = false;
		if ( not self:IsShown() ) then
			SubZoneTextString:SetText( subzoneText );
			SetZoneText( showZoneText );
			FadingFrame_Show( SubZoneTextFrame );
		end
	else
		if (self:IsShown()) then
			showZoneText = true;
		end
		SubZoneTextString:SetText( subzoneText );
		SetZoneText( showZoneText );
		FadingFrame_Show( SubZoneTextFrame );
	end
end
 
function SubZoneText_OnLoad(self)
    FadingFrame_OnLoad(self);
    FadingFrame_SetFadeInTime(self, ZoneFadeInDuration);
    FadingFrame_SetHoldTime(self, ZoneHoldDuration);
    FadingFrame_SetFadeOutTime(self, ZoneFadeOutDuration);
    PVPArenaTextString:SetTextColor(1, 0.1, 0.1);
    SetZoneText(true);
    SubZoneTextString:SetText(GetSubZoneText());
end
 
AUTOFOLLOW_STATUS_FADETIME = 7.0;
 
function AutoFollowStatus_OnLoad(self)
    self:RegisterEvent("AUTOFOLLOW_BEGIN");
    self:RegisterEvent("AUTOFOLLOW_END");
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
end
 
function AutoFollowStatus_OnEvent(self, event, ...)
    if ( event == "AUTOFOLLOW_BEGIN" ) then
        local arg1 = ...;
        self.unit = arg1;
        self.fadeTime = nil;
        self:SetAlpha(1);
        AutoFollowStatusText:SetFormattedText(AUTOFOLLOWSTART,self.unit);
        self:Show();
    end
    if ( event == "AUTOFOLLOW_END" ) then
        self.fadeTime = AUTOFOLLOW_STATUS_FADETIME;
        AutoFollowStatusText:SetFormattedText(AUTOFOLLOWSTOP,self.unit);
        self:Show();
    end
    if ( event == "PLAYER_ENTERING_WORLD" ) then
        self:Hide();
    end
end
 
function AutoFollowStatus_OnUpdate(self, elapsed)
    if( self.fadeTime ) then
        if( elapsed >= self.fadeTime ) then
            self:Hide();
        else
            self.fadeTime = self.fadeTime - elapsed;
            local alpha = self.fadeTime / AUTOFOLLOW_STATUS_FADETIME;
            self:SetAlpha(alpha);
        end
    end
end
