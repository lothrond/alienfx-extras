VERSION := 1.0

BIN ?= /usr/local/bin
DESKTOP ?= /usr/share/applications

LOCAL_USER := $(SUDO_USER)
LOCAL_HOME := /home/$(LOCAL_USER)

AUTOSTART := $(LOCAL_HOME)/.config/autostart
CONFIG := $(LOCAL_HOME)/.config/alienfx

SRC_BIN := alienfx-autostart alienfx-toggle
SRC_AUTOSTART := alienfx-autostart.desktop alienfx-toggle.desktop
SRC_CONFIG := blue.json off.json green.json orange.json red.json

.PHONY: install
install: $(SRC_AUTOSTART) $(SRC_BIN) $(SRC_CONFIG)
	cp $(SRC_BIN) $(BIN)
	chmod 755 $(BIN)/alienfx-autostart
	chmod 755 $(BIN)/alienfx-toggle
	cp alienfx-autostart.desktop $(AUTOSTART)
	cp alienfx-toggle.desktop $(DESKTOP)
	if [ ! -d $(CONFIG) ]; then mkdir -p $(CONFIG); fi
	cp $(SRC_CONFIG) $(CONFIG)
	chown $(LOCAL_USER):$(LOCAL_USER) $(AUTOSTART)/alienfx-autostart.desktop
	chown $(LOCAL_USER):$(LOCAL_USER) $(DESKTOP)/alienfx-toggle.desktop
	chown -R $(LOCAL_USER):$(LOCAL_USER) $(CONFIG)

.PHONY: remove
remove:
	rm $(BIN)/alienfx-autostart
	rm $(BIN)/alienfx-toggle
	rm $(AUTOSTART)/alienfx-autostart.desktop
	rm $(DESKTOP)/alienfx-toggle.desktop
	cd $(CONFIG) && rm blue.json off.json green.json orange.json red.json

