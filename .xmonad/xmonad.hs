import XMonad

import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig


main = xmonad $ def {
    focusedBorderColor = "#008000"
  , normalBorderColor = "#161616"
  , focusFollowsMouse = False
  , borderWidth = 1
  , terminal = "xterm"
  , workspaces = myWorkspaces
} `additionalKeys` myKeys

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
 
myKeys = [ 
    -- other additional keys 
    ] ++ 
    [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. mod1Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
         , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

