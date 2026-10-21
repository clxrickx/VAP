dt = 1/60 -- 60hz tick rate
null = 0

local att_x = {I = 0, prev = 0}
local att_z = {I = 0, prev = 0}


function onTick()
    -- IMU/RA IN
    x = input.getNumber(1)
    y = input.getNumber(2)
    z = input.getNumber(3)
    linV = input.getNumber(13)
    angV = input.getNumber(14)
    Zr = input.getNumber(15)
    Xr = input.getNumber(16)
    hdg = input.getNumber(17)
    ra = input.getNumber(18)

    land_x = null
    land_z = null

    errX = land_x - x
    errZ = land_z - z

    -- OUTPUTS
    x = output.setNumber(1, x)
    y = output.setNumber(2, y)
    z = output.setNumber(3, z)
    linV = output.setNumber(4, linV)
    angV = output.setNumber(5, angV)
    Zr = output.setNumber(6, Zr)
    Xr = output.setNumber(7, Xr)
    hdg = output.setNumber(8, hdg)
    ra = output.setNumber(9, ra)
end
