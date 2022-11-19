# catfood

i.MX6ULL board with NAND, DDR3, USB-A host port, microUSB device port/power, ethernet, wifi

## Update fields:

```
kifield --extract catfood.kicad_sch --recurse --group --norange --insert catfood.csv
kifield -x catfood.csv -i catfood.kicad_sch -w -r
```

## Key components

- MCIMX6Y2DVM09AB
    - Y:  ULL
    - 2:  General Purpose 2 (Full Feature)
    - D:  Commercial Temp
    - VM: 0.8mm pitch package
    - 09: 900MHz
    - A:  Reserved
    - B:  Silicon Rev 1.1

- PMIC

- NAND
    - MT29F4G08ABAEAWP:E
    - TODO: update

- RAM
    - IS43TR16256BL-107MBL
    - TODO: update

- PHY
    - LAN8700C-AEZG
    - TE 1888250-1
    - TODO: magnetics

- WiFi

## Design notes

### Boot mode selection

### Power tree / sequencing / current requirements

TODO: 3.3V and 1.35V

### PMIC etc

- TODO: ONOFF/~POR
- TODO: low power sleep
- TODO: WoL

### RTC

## Enclosure
