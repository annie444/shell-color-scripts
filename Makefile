GLOBAL_SCRIPT_DIR = /opt/shell-color-scripts
LOCAL_SCRIPT_DIR = $(HOME)/.local/share/shell-color-scripts

GLOBAL_BIN_DIR = /usr/local/bin
LOCAL_BIN_DIR = $(HOME)/.local/bin

SHELL_CMD = $(shell basename $$SHELL)

clean: 
	rm -rf $(GLOBAL_SCRIPT_DIR)

clean-local: 
	rm -rf $(LOCAL_SCRIPT_DIR)

install: clean
	mkdir -p $(GLOBAL_SCRIPT_DIR)/colorscripts
	cp -rf colorscripts/* $(GLOBAL_SCRIPT_DIR)/colorscripts
	cp colorscript.sh $(GLOBAL_BIN_DIR)/colorscript

install-local: clean
	mkdir -p $(LOCAL_SCRIPT_DIR)/colorscripts
	cp -rf colorscripts/* $(LOCAL_SCRIPT_DIR)/colorscripts
	cp colorscript.sh $(LOCAL_BIN_DIR)/colorscript
	[ $(SHELL_CMD) = "fish" ] && \
	cp -f completions/colorscript.fish $(HOME)/.config/fish/completions/colorscript.fish

uninstall:
	rm -rf $(GLOBAL_SCRIPT_DIR)
	rm -f $(GLOBAL_BIN_DIR)/colorscript

uninstall-local:
	rm -rf $(LOCAL_SCRIPT_DIR)
	rm -f $(LOCAL_BIN_DIR)/colorscript

