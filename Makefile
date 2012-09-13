INFORM = inform
SLAG = slag

DEBUG = "-~S"

GLULX = "-~G"

VERSION = r1pre2

BINNAME = sgate
EXTENSION = .z5

DISTNAME = $(BINNAME)-$(VERSION)
distdir = $(DISTNAME)


$(BINNAME):
	cd src ; $(INFORM) $(SWITCHES) $(BINNAME).inf ../$(BINNAME)$(EXTENSION)

nodebug:
	cd src ; $(INFORM) $(SWITCHES) $(DEBUG) $(BINNAME).inf ../$(BINNAME)$(EXTENSION)

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
	rm -f *core
	rm -f $(BINNAME)$(EXTENSION)
#	rm -f *.ulx

distclean: clean
	-rm -rf $(distdir)
	-rm -f $(distdir).tar $(distdir).tar.gz
