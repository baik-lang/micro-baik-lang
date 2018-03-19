INSTALL_LOG = install.log
VERSION = 8.15
BIN_DIR = ../bin
.PHONY : all install uninstall clean

all:
	@echo "Compiling.........................."
	@mkdir -p $(BIN_DIR)
	@gcc -o $(BIN_DIR)/baik -DUSE_SQLITE $(INCLUDES) $(LIBS) tbaik.c baik_ident.c baik_stack.c baik_expression.c baik_compare.c baik_factor.c interpreter.c interpreterSub.c interpreterClass.c sqlite_common.c -lpthread -lm -lsqlite3
	@echo "................................................"
	@echo "Makefile: Available actions: install, uninstall"

esp8266:
	@echo "Compiling to ESP8266 board"
	@mkdir -p $(BIN_DIR)
	@xtensa-lx106-elf-gcc -o $(BIN_DIR)/baik.elf -DESP8266 $(INCLUDES) $(LIBS) tbaik.c baik_ident.c baik_stack.c baik_expression.c baik_compare.c baik_factor.c interpreter.c interpreterSub.c interpreterClass.c sqlite_common.c -lpthread -lm
	@echo "................................................"
	@echo "Makefile: Available actions: install, uninstall"

install:
	-install -d -m 755 $(PREFIX)/bin
	-cp -R -L $(BIN_DIR)/baik $(PREFIX)/bin/

uninstall:
	rm -rf $(PREFIX)/bin/baik

clean:
	rm -rf $(BIN_DIR)
