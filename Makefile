V=20210427

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archlinuxmx.gpg $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archlinuxmx-trusted $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archlinuxmx-revoked $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/archlinuxmx{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=archlinuxmx-keyring-$(V)/ $(V) | gzip -9 > archlinuxmx-keyring-$(V).tar.gz
	gpg --detach-sign --use-agent archlinuxmx-keyring-$(V).tar.gz

upload:
	#scp archlinuxmx-keyring-$(V).tar.gz archlinux-keyring-$(V).tar.gz.sig repos.archlinux.org:/srv/ftp/other/archlinux-keyring/
	@echo FIXME

.PHONY: install uninstall dist upload
