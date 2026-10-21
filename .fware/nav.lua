dt = 1/60 -- 60hz tick rate
null = 0

local att_x = {I = 0, prev = 0}
local att_z = {I = 0, prev = 0}
local tvc_x = {I = 0, prev = 0}
local tvc_z = {I = 0, prev = 0}

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
    absV_lin = input.getNumber(13)
    absV_ang = input.getNumber(14)
    Zr = input.getNumber(15)
    Xr = input.getNumber(16)
    hdg = input.getNumber(17)
    ra = input.getNumber(18)

    land_x = null
    land_z = null

end
