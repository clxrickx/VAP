dt = 1/60 -- 60hz tick rate
null = 0

local tvcX = {I = 0, prev = 0}
local tvcZ = {I = 0, prev = 0}

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

function clamp(v, lo, hi)
    return math.max(lo, math.min(hi, v))
end

function onTick()
    -- IMU/RA IN
    x = input.getNumber(1)
    y = input.getNumber(2)
    z = input.getNumber(3)
    rotY = input.getNumber(5)
    linV = input.getNumber(13)
    angV = input.getNumber(14)
    Zr = input.getNumber(15)
    Xr = input.getNumber(16)
    ra = input.getNumber(18)

    vectorX = PID(tvcX, 0, Xr, 20, 0, 1) --tune pids first before adding "active stabliziation"
    vectorZ = PID(tvcZ, 0, Zr, 20, 0, 1)

    vectorX = clamp(vectorX, -0.4, 0.4)
    vectorZ = clamp(vectorZ, -0.4, 0.4)

    if y < 10 then
        resetPID(tvcX)
        resetPID(tvcZ)
    end

    -- OUTPUTS
    output.setNumber(1, x)
    output.setNumber(2, y)
    output.setNumber(3, z)
    output.setNumber(4, linV)
    output.setNumber(5, angV)
    output.setNumber(6, Zr)
    output.setNumber(7, Xr)
    output.setNumber(8, rotY)
    output.setNumber(9, ra)
    output.setNumber(10, vectorX)
    output.setNumber(11, vectorZ)
end
