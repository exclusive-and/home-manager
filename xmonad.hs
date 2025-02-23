import XMonad (xmonad, (|||))
import XMonad                       qualified as XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Layout.Gaps           qualified as XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing        qualified as XMonad
import XMonad.Util.SpawnOnce        qualified as XMonad

main :: IO ()
main = xmonad . ewmh . ewmhFullscreen $ XMonad.def
    { XMonad.modMask    = XMonad.mod4Mask       -- 
    , XMonad.terminal   = "alacritty"

    -- Whenever .xinitrc invokes me...
    , XMonad.startupHook = startupHook

    -- Whenever the window arrangement changes...
    , XMonad.layoutHook = layoutHook

    -- Window borders
    , XMonad.borderWidth        = 2
    , XMonad.focusedBorderColor = "#bc96da"     -- Purple-ish
    , XMonad.normalBorderColor  = "#3b4252"     -- Gray

    -- Mouse focusing behavior
    , XMonad.clickJustFocuses   = False
    , XMonad.focusFollowsMouse  = False
    }

layoutHook =
    let
        layout = tiled ||| XMonad.Full
    in
        avoidStruts . smartBorders . gaps . spacing 10 $ layout
    where
        tiled   = XMonad.Tall nmaster delta ratio

        -- Default number of windows in the master pane
        nmaster = 1

        -- Default proportion of the screen taken up by the master pane
        ratio   = 1 / 2

        -- Percent of screen size to increment by when resizing
        delta   = 3 / 100

        gaps = XMonad.gaps [(L, 30), (R, 30), (U, 40), (D, 60)]

        spacing = XMonad.smartSpacing

startupHook = do
    setCursor
    setWallpaper
    where
        setCursor =
            XMonad.spawn "xsetroot -cursor_name left_ptr"

        setWallpaper =
            XMonad.spawnOnce "feh --bg-scale $HOME/wallpapers/apollo-soyuz.png"