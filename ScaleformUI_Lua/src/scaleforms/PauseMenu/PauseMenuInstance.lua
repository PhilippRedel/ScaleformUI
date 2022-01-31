PauseMenuInstance = {}

local pms = {}
pms = setmetatable({}, pms)

pms.__call = function()
    return true
end

pms.__index = pms

function PauseMenuInstance.New()
    local data = {
        _header = 0,
        _pause = 0,
        _visible = false
    }
    return setmetatable(data, pms)
end

function pms:Load()
    if self._header == 0 then
        self._header = Scaleform.Request("pausemenuheader")
        local timeout = 1000
        local start = GetGameTimer()
        while not self._header:IsLoaded() and GetGameTimer() - start < timeout do Citizen.Wait(0) end
    end

    if self._pause == 0 then
        self._pause = Scaleform.Request("pausemenu")
        local timeout = 1000
        local start = GetGameTimer()
        while not self._pause:IsLoaded() and GetGameTimer() - start < timeout do Citizen.Wait(0) end
    end
end

function pms:SetHeaderTitle(title, subtitle, shiftUpHeader)
    self._header:CallFunction("SET_HEADER_TITLE", false, title, subtitle, shiftUpHeader)
end

function pms:SetHeaderDetails(topDetail, midDetail, bottomDetail)
    self._header:CallFunction("SET_HEADER_DETAILS", false, topDetail, midDetail, bottomDetail, false)
end

function pms:ShiftCoronaDescription(shiftDesc, hideTabs)
    self._header:CallFunction("SHIFT_CORONA_DESC", false, shiftDesc, hideTabs)
end

function pms:ShowHeadingDetails(show)
    self._header:CallFunction("SHOW_HEADING_DETAILS", false, show)
end

function pms:SetHeaderCharImg(txd, charTexturePath, show)
    self._header:CallFunction("SET_HEADER_CHAR_IMG", false, txd, charTexturePath, show)
end

function pms:SetHeaderSecondaryImg(txd, charTexturePath, show)
    self._header:CallFunction("SET_HEADER_CREW_IMG", false, txd, charTexturePath, show)
end

function pms:HeaderGoRight()
    self._header:CallFunction("GO_RIGHT", false)
end

function pms:HeaderGoLeft()
    self._header:CallFunction("GO_LEFT", false)
end

function pms:AddPauseMenuTab(title, type)
    self._header:CallFunction("ADD_HEADER_TAB", false, title)
    self._pause:CallFunction("ADD_TAB", false, type)
end

function pms:AddLeftItem(tab, type, title, itemColor, highlightColor)
    if itemColor ~= Colours.NONE then
        self._pause:CallFunction("ADD_LEFT_ITEM", false, tab, type, title, itemColor)
    elseif itemColor ~= Colours.NONE && highlightColor ~= Colours.NONE then
        self._pause:CallFunction("ADD_LEFT_ITEM", false, tab, type, title, itemColor, highlightColor)
    else
        self._pause:CallFunction("ADD_LEFT_ITEM", false, tab, type, title)
    end
end

function pms:AddRightTitle(tab, leftItem, title)
    self._pause:CallFunction("ADD_RIGHT_TITLE", false, tab, leftItem, title)
end

function pms:AddRightListLabel(tab, leftItem, label)
    AddTextEntry("PauseMenu_" .. tab .. "_" .. leftItem, label)
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 0, "PauseMenu_" .. tab .. "_" .. leftItem)
end

function pms:AddRightStatItemLabel(tab, leftItem, label, rightLabel)
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 1, 0, label, rightLabel)
end

function pms:AddRightStatItemColorBar(tab, leftItem, label, value, barColor)
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 1, 1, label, value, barColor)
end

function pms:AddRightSettingsBaseItem(tab, leftItem, label, rightLabel)
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 2, 0, label, rightLabel)
end

function pms:AddRightSettingsListItem(tab, leftItem, label, items, startIndex)
    --TODO JOIN LIST TO STRING WITH COMMA
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 2, 1, label, stringList, startIndex)
end

function pms:AddRightSettingsProgressItem()
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 1, 1, label, value, barColor)
end

function pms:AddRightSettingsProgressItemAlt()
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 1, 1, label, value, barColor)
end

function pms:AddRightSettingsSliderItem()
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 1, 1, label, value, barColor)
end

function pms:AddRightSettingsCheckboxItem()
    self._pause:CallFunction("ADD_RIGHT_LIST_ITEM", false, tab, leftItem, 1, 1, label, value, barColor)
end

function pms:SetRightSettingsItemBool()

end

function pms:SetRightSettingsItemIndex()

end

function pms:SetRightSettingsItemValue()

end

function pms:UpdateItemRightLabel()

end

function pms:UpdateStatsItem()

end

function pms:UpdateStatsItem()

end

function pms:UpdateItemColoredBar()

end