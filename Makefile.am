
SUBDIRS = data include src

bomberclonedocdir = ${prefix}/share/doc/bomberclone
bomberclonedoc_DATA = \
	README\
	COPYING\
	AUTHORS\
	ChangeLog\
	INSTALL\
	NEWS\
	TODO \
	bomberclone.nsi

EXTRA_DIST = bomberclone.prj $(bomberclonedoc_DATA)

# Copy all the spec files. Of cource, only one is actually used.
dist-hook:
	for specfile in *.spec; do \
		if test -f $$specfile; then \
			cp -p $$specfile $(distdir); \
		fi \
	done
