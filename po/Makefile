# Makefile for program source directory in GNU NLS utilities package.
# Copyright (C) 1995, 1996, 1997 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
#
# This file file be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
# Please note that the actual code is *not* freely available.
#
# - Modified by Owen Taylor <otaylor@redhat.com> to use GETTEXT_PACKAGE
#   instead of PACKAGE and to look for po2tbl in ./ not in intl/
#
# - Modified by jacob berkman <jacob@ximian.com> to install
#   Makefile.in.in and po2tbl.sed.in for use with glib-gettextize

GETTEXT_PACKAGE = macopix
PACKAGE = macopix
VERSION = 3.4.0

SHELL = /bin/sh


srcdir = .
top_srcdir = ..


prefix = /usr/local
exec_prefix = ${prefix}
datadir = ${prefix}/share
libdir = ${exec_prefix}/lib
localedir = $(libdir)/locale
gnulocaledir = $(datadir)/locale
gettextsrcdir = $(datadir)/glib-2.0/gettext/po
subdir = po

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
MKINSTALLDIRS = $(top_srcdir)/.//mkinstalldirs

CC = gcc -std=gnu23
GENCAT = gencat
GMSGFMT = /opt/homebrew/bin/msgfmt
MSGFMT = /opt/homebrew/bin/msgfmt
XGETTEXT = /opt/homebrew/bin/xgettext
MSGMERGE = msgmerge

DEFS = -DHAVE_CONFIG_H
CFLAGS = -I/opt/homebrew/include -I/opt/homebrew/Cellar/openssl@3/3.6.2/include
CPPFLAGS = -I/opt/homebrew/Cellar/gtk-mac-integration/3.0.2/include/gtkmacintegration -DMAC_INTEGRATION -I/opt/homebrew/Cellar/gtk+3/3.24.52/include/gtk-3.0 -I/opt/homebrew/Cellar/pango/1.57.1/include/pango-1.0 -I/opt/homebrew/Cellar/libthai/0.1.30/include -I/opt/homebrew/Cellar/libdatrie/0.2.14/include -I/opt/homebrew/Cellar/harfbuzz/14.2.0/include/harfbuzz -I/opt/homebrew/opt/graphite2/include -I/opt/homebrew/Cellar/cairo/1.18.4/include -I/opt/homebrew/Cellar/cairo/1.18.4/include/cairo -I/opt/homebrew/Cellar/fontconfig/2.17.1/include -I/opt/homebrew/opt/freetype/include/freetype2 -I/opt/homebrew/Cellar/libxext/1.3.7/include -I/opt/homebrew/Cellar/xorgproto/2025.1/include -I/opt/homebrew/Cellar/libxrender/0.9.12/include -I/opt/homebrew/Cellar/libx11/1.8.13/include -I/opt/homebrew/Cellar/libxcb/1.17.0/include -I/opt/homebrew/Cellar/libxau/1.0.12/include -I/opt/homebrew/Cellar/libxdmcp/1.1.5/include -I/opt/homebrew/Cellar/pixman/0.46.4/include/pixman-1 -I/opt/homebrew/include/gdk-pixbuf-2.0 -I/opt/homebrew/opt/libpng/include/libpng16 -I/opt/homebrew/opt/libtiff/include -I/opt/homebrew/opt/zstd/include -I/opt/homebrew/Cellar/xz/5.8.3/include -I/opt/homebrew/opt/jpeg-turbo/include -I/opt/homebrew/Cellar/at-spi2-core/2.60.4/include/atk-1.0 -I/opt/homebrew/Cellar/libepoxy/1.5.10/include -I/opt/homebrew/Cellar/fribidi/1.0.16/include/fribidi -I/opt/homebrew/Cellar/glib/2.88.1/include/gio-unix-2.0 -I/opt/homebrew/Cellar/glib/2.88.1/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX26.sdk/usr/include/ffi -I/opt/homebrew/Cellar/glib/2.88.1/include/glib-2.0 -I/opt/homebrew/Cellar/glib/2.88.1/lib/glib-2.0/include -I/opt/homebrew/opt/gettext/include -I/opt/homebrew/Cellar/pcre2/10.47_1/include

INCLUDES = -I.. -I$(top_srcdir)/intl

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS) $(XCFLAGS)

SOURCES = 
POFILES =  ja.po uk.po
GMOFILES =  ja.gmo uk.gmo
DISTFILES = ChangeLog Makefile.in.in POTFILES.in $(GETTEXT_PACKAGE).pot \
$(POFILES) $(GMOFILES) $(SOURCES)

POTFILES = \
     ../src/alpha.c \
     ../src/balloon.c \
     ../src/base64.c \
     ../src/bmp.c \
     ../src/bmpwrite.c \
     ../src/callbacks.c \
     ../src/clock.c \
     ../src/codeconv.c \
     ../src/configfile.c \
     ../src/dnd.c \
     ../src/gtkut.c \
     ../src/gui.c \
     ../src/http-client.c \
     ../src/mail.c \
     ../src/main.c \
     ../src/md5c.c \
     ../src/md5ify.c \
     ../src/nokkari.c \
     ../src/pixmap.c \
     ../src/pop.c \
     ../src/quoted-printable.c \
     ../src/resources.c \
     ../src/sockmsg.c \
     ../src/ssl.c \
     ../src/sslmanager.c \
     ../src/trayicon.c \
     ../src/unlha.c \
     ../src/unmime.c \
     ../src/untar.c \
     ../src/utils.c

CATALOGS =  ja.gmo uk.gmo
CATOBJEXT = .gmo
INSTOBJEXT = .mo

.SUFFIXES:
.SUFFIXES: .c .o .po .pox .gmo .mo .msg .cat

.c.o:
	$(COMPILE) $<

.po.pox:
	$(MAKE) $(GETTEXT_PACKAGE).pot
	$(MSGMERGE) $< $(srcdir)/$(GETTEXT_PACKAGE).pot -o $*.pox

.po.mo:
	$(MSGFMT) -c -o $@ $<

.po.gmo:
	file=$(srcdir)/`echo $* | sed 's,.*/,,'`.gmo \
	  && rm -f $$file && $(GMSGFMT) -c --statistics -o $$file $<

.po.cat:
	sed -f ../intl/po2msg.sed < $< > $*.msg \
	  && rm -f $@ && $(GENCAT) $@ $*.msg


all: all-yes

all-yes: $(CATALOGS)
all-no:

$(srcdir)/$(GETTEXT_PACKAGE).pot: $(POTFILES)
	$(XGETTEXT) --default-domain=$(GETTEXT_PACKAGE) --directory=$(top_srcdir) \
	  --add-comments --keyword=_ --keyword=N_ --from-code="EUC-JP"\
	  --files-from=$(srcdir)/POTFILES.in \
	&& test ! -f $(GETTEXT_PACKAGE).po \
	   || ( rm -f $(srcdir)/$(GETTEXT_PACKAGE).pot \
		&& mv $(GETTEXT_PACKAGE).po $(srcdir)/$(GETTEXT_PACKAGE).pot )

install: install-exec install-data
install-exec:
install-data: install-data-yes
install-data-no: all
install-data-yes: all
	if test -r "$(MKINSTALLDIRS)"; then \
	  $(MKINSTALLDIRS) $(DESTDIR)$(datadir); \
	else \
	  $(SHELL) $(top_srcdir)/mkinstalldirs $(DESTDIR)$(datadir); \
	fi
	@catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  case "$$cat" in \
	    *.gmo) destdir=$(gnulocaledir);; \
	    *)     destdir=$(localedir);; \
	  esac; \
	  lang=`echo $$cat | sed 's/\$(CATOBJEXT)$$//'`; \
	  dir=$(DESTDIR)$$destdir/$$lang/LC_MESSAGES; \
	  if test -r "$(MKINSTALLDIRS)"; then \
	    $(MKINSTALLDIRS) $$dir; \
	  else \
	    $(SHELL) $(top_srcdir)/mkinstalldirs $$dir; \
	  fi; \
	  if test -r $$cat; then \
	    $(INSTALL_DATA) $$cat $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	    echo "installing $$cat as $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT)"; \
	  else \
	    $(INSTALL_DATA) $(srcdir)/$$cat $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	    echo "installing $(srcdir)/$$cat as" \
		 "$$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT)"; \
	  fi; \
	  if test -r $$cat.m; then \
	    $(INSTALL_DATA) $$cat.m $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	    echo "installing $$cat.m as $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m"; \
	  else \
	    if test -r $(srcdir)/$$cat.m ; then \
	      $(INSTALL_DATA) $(srcdir)/$$cat.m \
		$$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	      echo "installing $(srcdir)/$$cat as" \
		   "$$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m"; \
	    else \
	      true; \
	    fi; \
	  fi; \
	done
	if test "$(PACKAGE)" = "glib"; then \
	  if test -r "$(MKINSTALLDIRS)"; then \
	    $(MKINSTALLDIRS) $(DESTDIR)$(gettextsrcdir); \
	  else \
	    $(SHELL) $(top_srcdir)/mkinstalldirs $(DESTDIR)$(gettextsrcdir); \
	  fi; \
	  $(INSTALL_DATA) $(srcdir)/Makefile.in.in \
			  $(DESTDIR)$(gettextsrcdir)/Makefile.in.in; \
	else \
	  : ; \
	fi

# Define this as empty until I found a useful application.
installcheck:

uninstall:
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed 's/\$(CATOBJEXT)$$//'`; \
	  rm -f $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	  rm -f $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	  rm -f $(DESTDIR)$(gnulocaledir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	  rm -f $(DESTDIR)$(gnulocaledir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	done
	if test "$(PACKAGE)" = "glib"; then \
	  rm -f $(DESTDIR)$(gettextsrcdir)/Makefile.in.in; \
	fi

check: all

dvi info tags TAGS ID:

mostlyclean:
	rm -f core core.* *.pox $(GETTEXT_PACKAGE).po *.old.po cat-id-tbl.tmp
	rm -fr *.o *~

clean: mostlyclean

distclean: clean
	rm -f Makefile Makefile.in POTFILES *.mo *.msg *.cat *.cat.m

maintainer-clean: distclean
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."
	rm -f $(GMOFILES)

distdir = ../$(GETTEXT_PACKAGE)-$(VERSION)/$(subdir)
dist distdir: update-po $(DISTFILES)
	dists="$(DISTFILES)"; \
	for file in $$dists; do \
	  ln $(srcdir)/$$file $(distdir) 2> /dev/null \
	    || cp -p $(srcdir)/$$file $(distdir); \
	done

update-po: Makefile
	$(MAKE) $(GETTEXT_PACKAGE).pot
	tmpdir=`pwd`; \
	cd $(srcdir); \
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed 's/\$(CATOBJEXT)$$//'`; \
	  echo "$$lang:"; \
	  if $(MSGMERGE) $$lang.po $(GETTEXT_PACKAGE).pot -o $$tmpdir/$$lang.new.po; then \
	    if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
	      rm -f $$tmpdir/$$lang.new.po; \
            else \
	      if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
	        :; \
	      else \
	        echo "msgmerge for $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
	        rm -f $$tmpdir/$$lang.new.po; \
	        exit 1; \
	      fi; \
	    fi; \
	  else \
	    echo "msgmerge for $$cat failed!"; \
	    rm -f $$tmpdir/$$lang.new.po; \
	  fi; \
	done

# POTFILES is created from POTFILES.in by stripping comments, empty lines
# and Intltool tags (enclosed in square brackets), and appending a full
# relative path to them
POTFILES: POTFILES.in
	( if test 'x$(srcdir)' != 'x.'; then \
	    posrcprefix='$(top_srcdir)/'; \
	  else \
	    posrcprefix="../"; \
	  fi; \
	  rm -f $@-t $@ \
	    && (sed -e '/^#/d' 						\
		    -e "s/^\[.*\] +//" 					\
		    -e '/^[ 	]*$$/d' 				\
		    -e "s@.*@	$$posrcprefix& \\\\@" < $(srcdir)/$@.in	\
		| sed -e '$$s/\\$$//') > $@-t \
	    && chmod a-w $@-t \
	    && mv $@-t $@ )

Makefile: Makefile.in.in ../config.status POTFILES
	cd .. \
	  && CONFIG_FILES=$(subdir)/$@.in CONFIG_HEADERS= \
	       $(SHELL) ./config.status

# Tell versions [3.59,3.63) of GNU make not to export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
