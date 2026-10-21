dt = 1/60 -- 60hz tick rate
null = 0

local att_x = {I = 0, prev = 0}
local att_z = {I = 0, prev = 0}

function PID(state, sp, pv, Kp, Ki, Kd)
    local err = sp - pv

    local p = err
    state.I = state.I + (err * dt)
    local i = state.I
    local d = (err - state.prev) / dt

    state.prev = err

    local output = (p * Kp) + (i * Ki) + (d * Kd)
    return output
end

function resetPID(state)
    state.I = 0
    state.prev = 0
end

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

    tarAttX = PID(att_x, land_x, Xr, 1, 0, 0) --direct error calc for now, PID may not be needed here
    tarAttZ = PID(att_z, land_z, Xr, 1, 0, 0) -- "

    --rotate angles across the current heading of the rocket


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
