BUILD_DIRS := src

.PHONY: all build esp8266 ios osx wasm install uninstall clean $(BUILD_DIRS)

all: $(BUILD_DIRS)

build: $(BUILD_DIRS)

esp8266: $(BUILD_DIRS)

ios: $(BUILD_DIRS)

osx: $(BUILD_DIRS)

wasm: $(BUILD_DIRS)

install: $(BUILD_DIRS)

uninstall: $(BUILD_DIRS)

clean: $(BUILD_DIRS)

$(BUILD_DIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
