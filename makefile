
all: app.all x11.all shell.all dist.all
app.all: app.git app.vim app.mplayer app.dosbox app.nethack
x11.all: x11.xdefaults x11.xinitrc x11.musca
shell.all: shell.bash shell.tcsh
dist.all: dist.arch dist.freebsd

app.git:
	cp -f app/gitconfig ${HOME}/.gitconfig

app.vim:
	cp -f app/vimrc ${HOME}/.vimrc

app.mplayer:
	mkdir -p ${HOME}/.mplayer
	cp app/mplayer_config ${HOME}/.mplayer/config

app.dosbox:
	cp app/dosboxrc ${HOME}/.dosboxrc

app.nethack:
	cp app/nethackrc ${HOME}/.nethackrc

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

dist.arch:
	sudo mv -f /etc/rc.conf /etc/rc.conf.bak
	sudo cp -f dist/arch.rc.conf /etc/rc.conf
