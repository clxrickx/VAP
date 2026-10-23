null = 0
dt = 1/60

prevY = 0
prev_error = 0
i = 0
function PIDthr(sp, pv, Kp, Ki, Kd)
    err = sp - pv
    local p = err
    local i = i + (err * dt)
    local d = (err - prev_error) / dt

    prev_error  = err
    return (p * Kp) + (i * Ki) + (d * Kd)
end

function onTick()
    -- NAV IN
    x = input.getNumber(1)
    y = input.getNumber(2)
    z = input.getNumber(3)
    linV = input.getNumber(4)
    angV = input.getNumber(5)
    Zr = input.getNumber(6)
    Xr = input.getNumber(7)
    rotY = input.getNumber(8)
    ra = input.getNumber(9)
    vectorX = input.getNumber(10)
    vectorZ = input.getNumber(11)

    launch = input.getBool(1)
    
    vspd = (y - prevY) * 60
    prevY = y


    --add stage machine and throttle
    -- STAGE MACHINE
    launch_edge = launch and not prev_launch
    prev_launch = launch

    if y < 10 and not launch then --ground idle
        stage = 0
    elseif y < 100 and launch_edge then --powered flight
        stage = 1
    elseif stage == 1 then --stay in powered flight if conditions are still met
        stage = 1
    elseif y > 100 and vspd > 1 then --unpowered flight
        stage = 2
    elseif vspd < 1 and y < 50 then --powered descent
        stage = 3
    elseif y < 12 then --cutoff
        stage = 4
    else 
        stage = 4 --cutoff
    end

    if stage == 0 or stage == 2 or stage == 4 then
        thr = 0
    elseif stage == 1 then
        thr = 1
    elseif stage == 3 then
        thr = PIDthr(-10, vspd, 1, 0, 0)
    end

    if stage == 0 then
        vectorX, vectorZ = 0, 0
    end

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
    output.setNumber(12, thr) -- throttle
    output.setNumber(13, stage) -- stage
    output.setBool(1, launch)

    output.setNumber(19, -vectorX)
    output.setNumber(20, -vectorZ)
end
