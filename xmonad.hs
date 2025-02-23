import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.SpawnOnce (spawnOnce)

main = xmonad $ fullscreenSupport $ docks $ ewmh conf 

axarvaLayout = layout3
    where
        layout3 = gaps [(L, 30), (R, 30), (U, 40), (D, 60)] layout2
        layout2 = spacingRaw True (Border 10 10 10 10) True (Border 10 10 10 10) True layout1
        layout1 = smartBorders layout0

        layout0 = avoidStruts (tiled ||| Mirror tiled ||| Full)

        tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1 / 2
        delta   = 3 / 100

myStartupHook = do
    spawn "xsetroot -cursor_name left_ptr"
    spawnOnce "feh --bg-scale ~/wallpapers/buran.jpg"

conf = def  { startupHook = myStartupHook
            , layoutHook  = axarvaLayout
            , terminal    = "alacritty"
            , modMask     = mod4Mask
            , borderWidth         = 2
            , normalBorderColor   = "#3b4252"
            , focusedBorderColor  = "#bc96da"
            , focusFollowsMouse   = True
            , clickJustFocuses    = False
            }
