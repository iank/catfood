# catfood

i.MX6ULL board with NAND, DDR3L, USB-A host port, microUSB device port/power, ethernet

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

- Regulators
    - MP2143DJ
    - LMR10510XMF

- NAND
    - MT29F4G08ABAEAH4

- RAM
    - IS43TR16256BL-107MBL

- PHY
    - LAN8700C-AEZG
    - TE 1888250-1
    - Pulse H1102

## Design notes

### Boot mode selection

Boot from fuses w/ test point for serial downloader

### Power tree / sequencing / current requirements

| Rail		| Voltage	| Max Current | Description |
| ------------- | ------------- | ----------- | ----------- |
| VDD_5V_USB    | 5V            | TODO        | USB1 input  |
| VDD_3V3       | 3.3V          | 1A [1]      | Supplies VDD_HIGH_IN, VDD_SNVS_IN, NVCC_SD, VDDA_ADC_3P3, NVCC_UART, NVCC_GPIO, NVCC_NAND, NVCC_ENET, NVCC_CSI, NVCC_LCD, as well as the NAND and Ethernet PHY |
| VDD_1V35      | 1.35V         | 750mA [2]   | Supplies NVCC_DRAM and VDD_SOC_IN, as well as the DRAM |

#### Power budget

IMX6ULLCEC Table 13 gives equations or values for worst-case supply currents.
The worst case values for the maximum I/O equations are generally on the order
of ~1-2mA, so I have aggregated them. NXP's application note AN5345 gives some
measurements for DDR3L.

##### [1] 3.3V power budget

| i.MX6 rail      | Max current (mA) |
| --------------- | ---------------- |
| VDD_HIGH_IN     | 125              |
| VDD_SNVS_IN     | 0.5              |
| NVCC_SD/UART/GPIO/NAND/ENET/CSI/LCD | 35 |
| VDDA_ADC_3P3    | 35               |

| Other           | Max current (mA) |
| --------------- | ---------------- |
| NAND            | 30               |
| LAN8700C        | 82               |
| 1.35V @ 80% eff | 384              |

Total: 691.5 -> 1A

##### [2] 1.35V power budget

| i.MX6 rail       | Max current (mA) |
| ---------------- | ---------------- |
| NVCC_DRAM + DRAM | 125              |
| VDD_SOC_IN       | 500              |

Total: 625mA -> 750mA

#### Power tree/sequencing

3.3V must come up before 1.35V.

```
5V ---> 3V3_IN ---> 3V3 ---> 1V35
           |
           `---> 3V3_SNVS
```

### PMIC etc

- TODO: ONOFF/~POR
- TODO: low power sleep

### RTC

- TODO: 

### USB

- Power (5V 3A) will be provided to the board using USB_OTG1, a USB-C 2.0 device port.
- USB_OTG2 will be a type A 2.0 host port with a 1A current limit

## Enclosure

- TODO: 
