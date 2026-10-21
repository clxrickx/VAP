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
    output.setNumber(1, x)
    output.setNumber(2, y)
    output.setNumber(3, z)
    output.setNumber(4, linV)
    output.setNumber(5, angV)
    output.setNumber(6, Zr)
    output.setNumber(7, Xr)
    output.setNumber(8, hdg)
    output.setNumber(9, ra)
end
