
all: app.all x11.all
app.all: app.mplayer
x11.all: x11.xdefaults x11.xinitrc

app.mplayer:
	mkdir -p ${HOME}/.mplayer
	cp mplayer_config ${HOME}/.mplayer/config

x11.xdefaults:
	cp Xdefaults ${HOME}/.Xdefaults

x11.xinitrc:
	cp xinitrc ${HOME}/.xinitrc
