null = 0

function PIDthr(sp, pv, Kp, Ki, Kd)

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
    hdg = input.getNumber(8)
    ra = input.getNumber(9)
    vectorX = input.getNumber(10)
    vectorZ = input.getNumber(11)

    launch = input.getBool(1)

    --add stage machine and throttle

    output.setNumber(1, x)
    output.setNumber(2, y)
    output.setNumber(3, z)
    output.setNumber(4, linV)
    output.setNumber(5, angV)
    output.setNumber(6, Zr)
    output.setNumber(7, Xr)
    output.setNumber(8, hdg)
    output.setNumber(9, ra)
    output.setNumber(10, vectorX)
    output.setNumber(11, vectorZ)
    output.setNumber(12, null) -- throttle
    output.setNumber(13, null) -- stage
    output.setBool(1, launch)
end
