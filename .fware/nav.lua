dt = 1/60 -- 60hz tick rate
null = 0

tvcX = {I = 0, prev = 0}
tvcY = {I = 0, prev = 0}
thr = {I = 0, prev = 0}

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
