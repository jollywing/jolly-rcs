
all: app.all x11.all shell.all
app.all: app.mplayer
x11.all: x11.xdefaults x11.xinitrc x11.musca
shell.all: shell.bash shell.tcsh

app.mplayer:
	mkdir -p ${HOME}/.mplayer
	cp mplayer_config ${HOME}/.mplayer/config

x11.xdefaults:
	cp x11/Xdefaults ${HOME}/.Xdefaults

x11.xinitrc:
	cp x11/xinitrc ${HOME}/.xinitrc

MUSCA_PATH:=${HOME}/.musca
x11.musca:
	mkdir -p $(MUSCA_PATH)
	cp x11/musca/* $(MUSCA_PATH)

shell.bash:
	cp shell/bashrc ${HOME}/.bashrc

shell.tcsh:
	cp shell/tcshrc ${HOME}/.tcshrc
