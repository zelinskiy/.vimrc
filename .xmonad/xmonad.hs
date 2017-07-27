import XMonad

main = xmonad (defaultConfig {
    focusedBorderColor = "#008000"
  , normalBorderColor = "#161616"
  , focusFollowsMouse = False
  , borderWidth = 1
  , terminal = "xterm"
  })
