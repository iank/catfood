# catfood

i.MX6ULL board with NAND, DDR3, USB-A host port, microUSB device port/power, ethernet, SD, wifi

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
