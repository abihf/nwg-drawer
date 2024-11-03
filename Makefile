get:
	go get github.com/gotk3/gotk3
	go get github.com/gotk3/gotk3/gdk
	go get github.com/gotk3/gotk3/glib
	go get github.com/dlasky/gotk3-layershell/layershell
	go get github.com/joshuarubin/go-sway
	go get github.com/allan-simon/go-singleinstance
	go get "github.com/sirupsen/logrus"
	go get github.com/fsnotify/fsnotify

build:
	go build -v -o bin/nwg-drawer .

install:
	-pkill -f nwg-drawer
	sleep 1
	mkdir -p /usr/share/nwg-drawer
	cp -r desktop-directories /usr/share/nwg-drawer
	cp -r img /usr/share/nwg-drawer
	cp drawer.css /usr/share/nwg-drawer
	cp bin/nwg-drawer /usr/bin

	install -Dm 644 -t "/usr/share/licenses/nwg-drawer" LICENSE
	install -Dm 644 -t "/usr/share/doc/nwg-drawer" README.md

uninstall:
	rm -r /usr/share/nwg-drawer
	rm /usr/bin/nwg-drawer

run:
	go run .