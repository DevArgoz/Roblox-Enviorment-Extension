local PlayerToCuff = "PLAYER"
game.Players.LocalPlayer.Backpack.Handcuffs.RemoteEvent:FireServer("Cuff",workspace[PlayerToCuff]["Left Arm"])
wait(.1)
game.Players.LocalPlayer.Backpack.Handcuffs.RemoteEvent:FireServer("UnCuff")
