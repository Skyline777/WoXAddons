ZoneFadeInDuration = 0.5;
ZoneHoldDuration = 1;
ZoneFadeOutDuration = 2.0;
ZonePVPType = nil;
 
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
    if (   areaId == 322    -- Orgrimmar
        or areaId == 10     -- Mulgore
        or areaId == 363    -- Thunderbluff
        or areaId == 242    -- Moonglade
        or areaId == 42     -- Teldrassil
        or areaId == 382    -- Darnassus
        or areaId == 5      -- Durotar
        or areaId == 302    -- Stormwind
        or areaId == 31     -- Elwynn Forest
        or areaId == 342    -- Iron Forge
        or areaId == 21     -- Tirisfal Glades
        or areaId == 15     -- Deeprun Tram
        or areaId == 28     -- Dun Morogh
        or areaId == 383    -- Undercity
       ) then
        pvpTextString:SetFormattedText("("..HIGHSec..")");
        pvpTextString:SetTextColor(0, 1, 0); -- Green
        ZoneTextString:SetTextColor(0, 1, 0);
        SubZoneTextString:SetTextColor(0, 1, 0);
    elseif (    areaId == 44    -- Ashenvale
             or areaId == 43    -- Dark Shore
             or areaId == 12    -- The Barrens
             or areaId == 62    -- Thousand Needles
             or areaId == 162   -- Tanaris
             or areaId == 82    -- Stonetalon Mountains
             or areaId == 14    -- Wailing Caverns (Barrens) // Blackfathom Deeps (Ashenvale)
             or areaId == 38    -- Stranglethorn Vale
           ) then
        pvpTextString:SetText("("..LOWSec..")");
        pvpTextString:SetTextColor(1, 0.6, 0.2); -- Orange
        ZoneTextString:SetTextColor(1, 0.6, 0.2);
        SubZoneTextString:SetTextColor(1, 0.6, 0.2);
    elseif (    areaId == 102   -- Desolace
             or areaId == 183   -- Felwood
             or areaId == 142   -- Dustwallow Marsh
             or areaId == 182   -- Azshara
             or areaId == 122   -- Feralas
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
