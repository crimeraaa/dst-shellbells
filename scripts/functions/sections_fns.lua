SectionsHelper = {}

SectionsHelper.MakeSections = function(...)
    local rets = {}
    local all_sections = {...}
    for _, indiv_part in pairs(all_sections) do
        for i, v in ipairs(indiv_part) do
            table.insert(rets, v)
        end
    end
    return rets
end

SectionsHelper.CheckSections = function(song_tbl)
    print("data.notes:", song_tbl)
    for i, tbl in ipairs(song_tbl) do
        print(i, tbl[1], tbl.t)
    end
end

return SectionsHelper