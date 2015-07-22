# Makefile for msys2-scripts - a set of scripts for install and run msys2 on wine
#
# Copyright (C) 2015 Qian Hong.
#
# msys2-scripts comes with ABSOLUTELY NO WARRANTY.
#
# This is free software, placed under the terms of the
# GNU Lesser Public License version 2.1, as published by the Free Software
# Foundation. Please see the file src/COPYING for details.
#
# Web Page: http://github.com/fracting
#
# Maintainer:
# Qian Hong <fracting@gmail.com>

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644
SOURCES = Makefile src

version="0.1"

PREFIX = /usr

all:
	@ echo "Nothing to compile. Use: install, clean, cleanup"

# Editor backup files etc.
clean:
	find . -name "*[#~]" \
		-o -name "*.\#*" \
		-o -name "*.orig" \
		-o -name "*.porig" \
		-o -name "*.rej" \
		-o -name "*.log" \
		-o -name "*.out" \
		-o -name "*.verbs" \
	| xargs --no-run-if-empty rm
	rm -rf src/df-* src/measurements src/links.d

# Remove trailing whitespaces
cleanup:
	sed --in-place 's,[ \t]\+$$,,' $$(find $(SOURCES) -type f)

install:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL_PROGRAM) src/msys2-install $(DESTDIR)$(PREFIX)/bin/msys2-install
	$(INSTALL_PROGRAM) src/msys2-wrapper $(DESTDIR)$(PREFIX)/bin/msys2-wrapper
	$(INSTALL) -d $(DESTDIR)/etc
	$(INSTALL_PROGRAM) src/msys2-env $(DESTDIR)/etc/msys2-env
