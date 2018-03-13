BUILD_DIRS := src

.PHONY: all install uninstall clean $(BUILD_DIRS)

all: $(BUILD_DIRS)

install: $(BUILD_DIRS)

uninstall: $(BUILD_DIRS)

clean: $(BUILD_DIRS)

$(BUILD_DIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
