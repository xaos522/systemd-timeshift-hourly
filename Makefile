PKGNAME ?= systemd-timeshift-hourly

SYSTEMD ?= true

ETC_DIR = $(DESTDIR)/etc

.PHONY: install uninstall

install:
	@if test "$(shell id -u)" != 0; then \
		echo "You are not root, run this target as root please."; \
		exit 1; \
	fi
	@echo "					     	   Installing "
	@echo
	@# Systemd init system
	@if test "$(SYSTEMD)" = true; then \
		echo "Installing systemd .service file"; \
		install -Dm644 -t "$(ETC_DIR)/systemd/system/" systemd-timeshift-hourly.service; \
		echo "Installing systemd .timer file"; \
		install -Dm644 -t "$(ETC_DIR)/systemd/system/" systemd-timeshift-hourly.timer; \
	 fi

uninstall:
	@echo "Uninstalling systemd-timeshift-hourly"
	@if test "$(shell id -u)" != 0; then \
		echo "You are not root, run this target as root please."; \
		exit 1; \
	fi
	@rm -f "$(ETC_DIR)/systemd/system/systemd-timeshift-hourly.service"
	@rm -f "$(ETC_DIR)/systemd/system/systemd-timeshift-hourly.timer"
