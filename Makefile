TARGET			= vtrgb-gnome
INSTALL_DIR  	= $(PREFIX)/etc

.PHONY: all install uninstall install-alternative set-alternative remove-alternative

all:

install: $(INSTALL_DIR)/$(TARGET)

uninstall: remove-alternative
	rm -f $(INSTALL_DIR)/$(TARGET)

### Executable =================================================================

$(INSTALL_DIR):
	mkdir -p $@

$(INSTALL_DIR)/$(TARGET): $(TARGET) $(INSTALL_DIR)
	install $< $@

### Alternatives ===============================================================

install-alternative: $(INSTALL_DIR)/$(TARGET)
	update-alternatives --install $(INSTALL_DIR)/vtrgb vtrgb $(INSTALL_DIR)/$(TARGET) 150
	
set-alternative: $(INSTALL_DIR)/$(TARGET)
	update-alternatives --set vtrgb $(INSTALL_DIR)/$(TARGET)

remove-alternative:
	update-alternatives --remove vtrgb $(INSTALL_DIR)/$(TARGET)
