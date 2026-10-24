function onTick()
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
    vspd = input.getNumber(19)
    dx = input.getNumber(20)
    dz = input.getNumber(21)

    launch = input.getBool(1)

end

function onDraw()
    if (bat < 0.15) or (fuel < 10)then --warning
        screen.setColor(155, 0, 0)
    elseif (bat < 0.5) or (fuel < 50) then --caution
        screen.setColor(155, 155, 0)
    else --normal
        screen.setColor(0, 155, 0)
    end
    screen.drawRectF(1, 1, 160, 4)
    screen.setColor(255, 255, 255)
    
    screen.drawText(3, 3, "STAGE" .. stage)

    screen.drawText(3, 8, "X:" .. string.format("%.0f", x))
    screen.drawText(45, 8, "Y:" .. string.format("%.0f", y))
    screen.drawText(77, 8, "Z:" .. string.format("%.0f", z))

    screen.drawText(3, 16, "Xr:" .. string.format("%.0f", Xr * 360))
    screen.drawText(50, 16, "Zr:" .. string.format("%.0f", Zr * 360))

    screen.drawText(3, 24, "TVCx:" .. vectorX)
    screen.drawText(50, 24, "TVCz:" .. vectorZ)
end
