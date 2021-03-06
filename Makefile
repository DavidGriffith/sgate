VERSION = r8
BINNAME = sgate
EXTENSION = .z5


INFORM = inform

NODEBUG = -~D~S
DEBUG = -D

SWITCHES = -e

DISTNAME = $(BINNAME)-$(VERSION)
distdir = $(DISTNAME)


$(BINNAME):
	cd src ; $(INFORM) $(SWITCHES) $(DEBUG) $(BINNAME).inf ../$(BINNAME)$(EXTENSION)

nodebug:
	cd src ; $(INFORM) $(SWITCHES) $(NODEBUG) $(BINNAME).inf ../$(BINNAME)$(EXTENSION)

abbrev:
	cd src ; $(INFORM) $(SWITCHES) $(DEBUG) -u $(BINNAME).inf ../$(BINNAME)$(EXTENSION)

#glulx:
#	$(INFORM) $(GLULX) src/$(BINNAME).inf $(BINNAME).ulx
	
dist: distclean
	mkdir $(distdir)
	@for file in `ls`; do \
		if test $$file != $(distdir); then \
			cp -rp $$file $(distdir)/$$file; \
		fi; \
	done
	tar chof $(distdir).tar $(distdir)
	gzip -f --best $(distdir).tar
	rm -rf $(distdir)
	@echo
	@echo "$(distdir).tar.gz created"
	@echo 

clean:
	rm -f *core src/*.core
	rm -f *.sav
	rm -f $(BINNAME)$(EXTENSION)
	rm -f $(BINNAME)$(EXTENSION).gz
	rm -f $(BINNAME)$(EXTENSION).bz2
#	rm -f *.ulx

distclean: clean
	-rm -rf $(distdir)
	-rm -f $(distdir).tar $(distdir).tar.gz
