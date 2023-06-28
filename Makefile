#!/usr/bin/make
KIBOT?=kibot
DEBUG?=
OUT_DIR=Generated
EXTRA_OPS=-e catfood.kicad_sch --banner -1 --log $(OUT_DIR)/kibot.log $(DEBUG)

all: erc catfood

erc:
	$(KIBOT) $(EXTRA_OPS) -d $(OUT_DIR) -s run_drc -i

drc:
	$(KIBOT) $(EXTRA_OPS) -d $(OUT_DIR) -s run_erc -i

catfood:
	$(KIBOT) $(EXTRA_OPS) -d $(OUT_DIR) -s run_erc,run_drc

.PHONY: catfood erc drc
