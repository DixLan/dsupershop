# dsupershop



24/7 Shop FULL RAGUI full opti with a config.lua ready for all modification for FiveM serveur 



**<u>CREATOR</u>** : **Dixlan#3750** *with the support of* **Galaxie Geek**

**<u>OPTIMISATION</u>** : 0.00ms

**<u>LICENCE</u>** : MIT License

## Requirements

* None!

## Download & Installation

* Download and extract the package
* Drop the `dsupershop-master` directory into you `resources` directory
* Rename the directory from `dsupershop-master` to `dsupershop`
* Add `ensure dsupershop` in your `server.cfg`
* Edit `config.lua` to your liking
* Start your server and rejoice!

## Configuration

```lua
Config = {}

Config.money = {
    unit = "$"
}

-- Les items du menu nourritures
Config.food = {
    {nom = "Pain", price = 2, label = "bread", ammount = 1},
    {nom = "Sandwich", price = 3, label = "sandwich", ammount = 1},
    {nom = "Hamburger", price = 6, label = "hamburger", ammount = 1},
}

-- Les items du menu boissons
Config.drink = {
    {nom = "Lait", price = 3, label = "milk", ammount = 1},
    {nom = "Eau", price = 1, label = "water", ammount = 1}
}

-- Les items du menus divers
Config.divers = {
    {nom = "Téléphone", price = 550, label = "phone", ammount = 1},
    {nom = "Cigarettes", price = 8, label = "cigarett", ammount = 20},
    {nom = "Briquet", price = 2, label = "lighter", ammount = 1},

}

-- true = afficher les blips false = ne pas les afficher
Config.Blips = {
    Afficher = true
}


-- Les position de chaque points avec leur blips
Config.position = {
    pos = {
        vector3(26.027, -1347.695, 29.29),
        vector3(1136.233, -982.393, 46.21),
        vector3(-2968.33, 391.400, 14.84),
        vector3(-1487.764, -379.20, 39.96),
        vector3(1961.736, 3740.466, 32.12971),
        vector3(-707.9341, -914.5978, 19.00361),
        vector3(1729.358, 6414.211, 34.82563),
        vector3(-1222.655, -906.567, 12.11213),
        vector3(373.932, 325.649, 103.36),
        vector3(-48.71209, -1757.591, 29.21467),
        vector3(547.3582, 2671.583, 41.95308),
        vector3(2557.503, 382.5494, 108.4088),
        vector3(-3241.965, 1001.736, 12.61763),
        vector3(1392.593, 3604.299, 34.7751),
        vector3(2679.363, 3280.826, 55.02852),
        vector3(1165.648, 2708.809, 37.94282),
        vector3(1698.435, 4924.879, 41.852),
        vector3(1163.209, -324, 68.99702),
        vector3(-1820.796, 792.1978, 137.9128),
        vector3(-3039.204, 586.4835, 7.897461),
        }
}
```

