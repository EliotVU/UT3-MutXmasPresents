# MutXmasPresents for Unreal Tournament 3

A drop-in mutator to spice up the bloody action with seasonal Xmas presents.

With MutXmasPresents random presents will be summoned at various locations for players to pickup. 

![A present](https://user-images.githubusercontent.com/808593/207734615-e572c48d-d5b7-43d8-b90a-3424e2e6fd70.jpg)

Credits to Soto for contributing the present mesh.

## Features

Santa will drop a present selected from his bag every 25 to 45 seconds!

Santa's bag contains the following unique items:

    Santa PowerUp
    Santa MiniMe
    Berserker
    Double Damage
    Invisibility
    Invulnerability
    Jump Boots
    Deployable EMP Mine
    Deployable Energy Shield
    Deployable Shaped Charge
    Deployable Slow Field
    Deployable Spider Mine

Additionaly the mutator can also be configured to include presents of your choice! 

> **Config/UTMutXMasPresents.ini**
```
[MutXMasPresents.MutXMasPresents]
SpawnIntervalMin=25.00000  ;Min time for spawning a present
SpawnIntervalMax=45.00000  ;Max time for spawning a present

// List of present inventory classes, you can add weapons to this too.
Presents=MUTXMasPresents.SantaPowerUp
Presents=UTGameContent.UTBerserk
Presents=UTGameContent.UTInvisibility
Presents=UTGameContent.UTInvulnerability
Presents=UTGameContent.UTJumpBoots
Presents=UTGameContent.UTDeployableEMPMine
Presents=UTGameContent.UTDeployableEnergyShield
Presents=UTGameContent.UTDeployableShapedCharge
Presents=UTGameContent.UTDeployableSlowVolume
Presents=UTGameContent.UTDeployableSpiderMineTrap
Presents=UTGameContent.UTUDamage
Presents=MUTXMasPresents.MiniMe
```
