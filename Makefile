BUILD_DIRS := src

.PHONY: all esp8266 ios install uninstall clean $(BUILD_DIRS)

all: $(BUILD_DIRS)

esp8266: $(BUILD_DIRS)

ios: $(BUILD_DIRS)

install: $(BUILD_DIRS)

uninstall: $(BUILD_DIRS)

clean: $(BUILD_DIRS)

$(BUILD_DIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
