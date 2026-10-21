prevY = 0

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
    thr = input.getNumber(12)
    stage = input.getNumber(13)
    servoX = input.getNumber(14)
    servoZ = input.getNumber(15)
    jetPressure = input.getNumber(16)
    fuel = input.getNumber(17)
    bat = input.getNumber(18)

    launch = input.getBool(1)

    vspd = prevY - y
    prevY = y

    dX = vectorX - servoX
    dZ = vectorZ - servoZ

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
    output.setNumber(12, thr)
    output.setNumber(13, stage)
    output.setNumber(14, servoX)
    output.setNumber(15, servoZ)
    output.setNumber(16, jetPressure)
    output.setNumber(17, fuel)
    output.setNumber(18, bat)
    output.setNumber(19, vspd)
    output.setNumber(20, dX)
    output.setNumber(21, dZ)

    output.setBool(1, launch)
end

function onDraw()
    screen.setColor(255, 255, 255)
    screen.drawText(5, 5, "S" .. stage)
    screen.drawText(5, 13, null) -- stagename
end