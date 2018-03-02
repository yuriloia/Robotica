clear all
mylego = legoev3('usb');
cor = colorSensor(mylego,1);
i = 0;
tic
while(1)
    intensity = readLight(cor)
    i = i + 1;
end
toc