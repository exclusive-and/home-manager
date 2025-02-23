{
    services.picom = {
        enable = true;
        activeOpacity = 1.00;
        backend = "glx";
        fade = true;
        fadeDelta = 2;
        inactiveOpacity = 0.50;
        settings = {
            blur = {
                method = "gaussian";
                size = 10;
                deviation = 5.0;
            };
            corner-radius = 12;
            detect-rounded-corners = true;
            experimental-backends = false;
            frame-pacing = false;
            refresh-rate = 0;
            round-borders = 1;
        };
        vSync = true;
    };
}