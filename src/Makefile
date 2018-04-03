INSTALL_LOG = install.log
VERSION = 8.15
BIN_DIR = ../bin

GCC_BIN_IOS=`xcrun -sdk iphoneos -find gcc`
GCC_IOS=$(GCC_BASE_IOS) -arch armv7 -arch armv7s -arch arm64
SDK_IOS=`xcrun -sdk iphoneos --show-sdk-path`
CFLAGS_IOS = -DIOS
GCC_BASE_IOS = $(GCC_BIN_IOS) -Os $(CFLAGS_IOS) -isysroot $(SDK_IOS) -F$(SDK_IOS)/System/Library/Frameworks -F$(SDK_IOS)/System/Library/PrivateFrameworks

.PHONY : all build install uninstall clean esp8266 ios osx

all: build

build:
	@echo "Compiling.........................."
	@mkdir -p $(BIN_DIR)
	@gcc -w -o $(BIN_DIR)/baik -DUSE_SQLITE $(INCLUDES) $(LIBS) tbaik.c baik_ident.c baik_stack.c baik_expression.c baik_compare.c baik_factor.c interpreter.c interpreterSub.c interpreterClass.c sqlite_common.c -lpthread -lm -lsqlite3
	@echo "................................................"
	@echo "Makefile: Available actions: install, uninstall"

esp8266:
	@echo "Compiling to ESP8266 board"
	@mkdir -p $(BIN_DIR)
	@xtensa-lx106-elf-gcc -w -o $(BIN_DIR)/baik.elf -DESP8266 $(INCLUDES) $(LIBS) tbaik.c baik_ident.c baik_stack.c baik_expression.c baik_compare.c baik_factor.c interpreter.c interpreterSub.c interpreterClass.c sqlite_common.c -lpthread -lm
	@echo "................................................"
	@echo "Makefile: Available actions: install, uninstall"

ios: tbaik.c baik_ident.c baik_stack.c baik_expression.c baik_compare.c baik_factor.c interpreter.c interpreterSub.c interpreterClass.c
	@echo "Compiling to iOS device"
	@mkdir -p $(BIN_DIR)
	@$(GCC_IOS) -w -o $(BIN_DIR)/baik.ios $^ -lpthread -lm
	@echo "Bypass signature"
	@ldid -S $(BIN_DIR)/baik.ios

osx: build
	@echo "Build package"
	mkdir -p $(BIN_DIR)/usr/local/bin
	sudo chown -R root:wheel $(BIN_DIR)
	sudo mv $(BIN_DIR)/baik $(BIN_DIR)/usr/local/bin
	sudo chmod +x $(BIN_DIR)/usr/local/bin
	sudo pkgbuild --root $(BIN_DIR) --identifier org.toroo.baik --version 8.2 $(BIN_DIR)/uBaik-lang.pkg

install:
	-install -d -m 755 $(PREFIX)/bin
	-cp -R -L $(BIN_DIR)/baik $(PREFIX)/bin/

uninstall:
	rm -rf $(PREFIX)/bin/baik

clean:
	sudo rm -rf $(BIN_DIR)
