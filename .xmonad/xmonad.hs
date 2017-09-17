import XMonad

import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName


main = xmonad $ def {
    focusedBorderColor = "#008000"
  , normalBorderColor = "#161616"
  , focusFollowsMouse = False
  , borderWidth = 1
  , terminal = "xterm"
  , workspaces = myWorkspaces
  , modMask = mod4Mask
  , startupHook = setWMName "LG3D"
} `additionalKeys` myKeys

myWorkspaces = ["2","1","3","4","5","6","7","8","9"]
 
myKeys = [ 
    -- other additional keys 
<<<<<<< HEAD
    ] ++
    [ {-((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),-}
      ((0 , 0x1008FF11), spawn "amixer set Master 2-"),
      ((0 , 0x1008FF13), spawn "amixer set Master 2+"),
      ((0 , 0x1008FF12), spawn "amixer set Master toggle")
    ] ++
    [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
=======
    ] ++ 
    [ ((0 , 0x1008FF11), spawn "amixer set Master 2-"),
      ((0 , 0x1008FF13), spawn "amixer set Master 2+"),
      ((0 , 0x1008FF12), spawn "amixer set Master toggle")
    ] ++
    [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
>>>>>>> ec2bdd6f2e1b2afda78424378f3aa165adbc41e8
        | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. mod4Mask, k), windows $ f i)
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
         , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

