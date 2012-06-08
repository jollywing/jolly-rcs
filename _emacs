;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jiqing's .emacs for Emacs23
;; Email: jiqingwu@gmail.com
;; create on 2008-03-25
;; update on 2012-06-06
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Look and Feels
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(create-fontset-from-fontset-spec
;  "-*-clean-*-*-*-*-*-*-*-*-*-*-fontset-global, 
;  chinese-gb2312:-*-simhei-*-*-*-*-17-*-*-*-*-*-gb2312.1980-*")
;(set-default-font "fontset-global")
;; let new frame use fontset-global
;(setq default-frame-alist 
;	  (append '((font . "fontset-global")) default-frame-alist))
;

;(set-default-font "Bitstream Vera Sans Mono-14")
;(set-frame-font "courier 10 pitch-12")

;; (setq default-frame-alist 
;; (append 
;; '((font . "consolas-14")
;;   (background-color . "gray75")
;;   (foreground-color . "black")
;;   (cursor-color . "dark red")
;; )
;;  default-frame-alist))

(setq default-frame-alist 
(append 
'((font . "consolas-14")
  (background-color . "#133333")
  (foreground-color . "#f6d149")
  (cursor-color . "#c760f4"))
 default-frame-alist))

;; 中文字体
;; (set-fontset-font "fontset-default" 'unicode 
;;                   '("microsoft yahei" . "unicode-bmp"))
(set-fontset-font "fontset-default" 'unicode
                  '("lihei pro" . "unicode-bmp"))

;; 通过 customize-face 定制的外观
(setq custom-file "~/blog/emacs-lisp/emacs-custom.el")
(load custom-file)

;;(setq load-path (cons "~/blog/emacs-lisp/color-theme-6.6.0"
;;                      load-path))
;;(require 'color-theme)
;;(load-file "~/blog/emacs-lisp/color-theme-6.6.0/themes/color-theme-hacker.el")
;;(my-color-theme)

;; no cursor blink
(blink-cursor-mode -1)
;; if under terminal, remove menu
(if (equal window-system nil) (menu-bar-mode nil))
;; no tool bar
(tool-bar-mode nil)
;; tooltip ...
(tooltip-mode nil)
;; no scrollbar
(scroll-bar-mode nil)

;; show line number and column number in state bar
(setq line-number-mode t)
(setq column-number-mode t)

;; highlight the mark region
(setq transient-mark-mode 1)

(setq inhibit-startup-message t)

;; show the absolute path in frame title
;;(setq frame-title-format "emacs@%f")
;; show the buffer name in frame title
;;(setq frame-title-format "emacs:: %b")

;; show date in state bar
;;(display-time-mode 1)
;;(setq display-time-24hr-format t)
;;(setq display-time-day-and-date t)

(display-battery-mode 1)

(global-font-lock-mode t)       ;sytax on

;; 定义窗口标题
(defun frame-title-string()
  "Return the file name of buffer name, 
using ~ instead of $HOME"
  (let ( (fname (or (buffer-file-name (current-buffer))
                    (buffer-name)))
         (max-len 90) )
    (when (string-match (getenv "HOME") fname)
      (setq fname (replace-match "~" t t fname)))
    (if (> (length fname) max-len)
        (setq fname (concat "..."
                            (substring fname 
                                       (- (length fname) max-len)))))
    fname))

(setq frame-title-format '("Emacs@"(:eval(frame-title-string))))

;; 增大行距
(setq-default line-spacing 2)

;; (require 'tabbar)
;; (tabbar-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Encodings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; before emacs 22 for gbk. it is not neccessary now.
;; (require 'mule-gbk)

;; check whether is chinese when open file
;; For cp936, gb2312
(set-language-environment 'Chinese-GB)
;; encoding method of write file
(set-buffer-file-coding-system 'utf-8)
;; encoding method of new file
(setq default-buffer-file-coding-system 'utf-8)
;; According to your locale of ctype
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; encoding method of reading and writing file name
;; 'utf-8 is good selection under linux
(setq file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default pathname-coding-system 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Editing Behaviors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; when all characters in a line are removed, 
;; this line is also deleted 
(setq-default kill-whole-line t)


(setq default-fill-column 65)
(auto-fill-mode t)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'text-mode-hook 'hl-line-mode)

(setq x-select-enable-clipboard t)

(setq mouse-yank-at-point t)

;; function set
(fset 'yes-or-no-p 'y-or-n-p)

(setq sentence-end-double-space nil)

;; inhibit autosave
(setq auto-save-default nil)

;; inhibit backup
(setq-default make-backup-files nil)
(setq delete-auto-save-files t)

(iswitchb-mode 1)
;;(ido-mode t)
;; when you already are located at the last line, you
;; ask Emacs to go to the next line, where a newline is 
;; inserted (or not, where bell rings)
;;(setq next-line-add-newlines t)
(setq next-line-add-newlines nil)

;; If non-nil, whenever the cursor is at the end of the line,
;; stick to the end of the line when moving the cursor up or down;
;; otherwise, stay in the column where the cursor is.
(setq track-eol nil)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq visible-bell t)

;;(mouse-avoidance-mode 'animate)
(mouse-avoidance-mode 'jump)
;; turn on mouse in console mode
(xterm-mouse-mode t)


;; 最近打开的文档
(require 'recentf)
(setq recentf-max-saved-items 25)
(recentf-mode 1)
;; add at the front of list, don't conncect to remote hosts
(add-to-list 'recentf-keep 'file-remote-p)

(global-set-key [(f2)] 'kill-this-buffer)
(global-set-key [(f5)] 'shell)
(global-set-key [(f6)] 'outline-minor-mode)
(global-set-key [(f7)] 'advertised-undo)
(global-set-key [(f8)] 'other-window)

;; show matched bracket
(show-paren-mode 1)
(setq show-parent-style 'parenthesis)
;; key bings for going to the matching starting or ending
;; brace called forward-sexp and backward-sexp
;; Note that this is done by default in XEmacs
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)

;; show picture in emacs
(auto-image-file-mode)
(auto-compression-mode 1)

;; auto line break
(setq truncate-partial-width-windows nil)

;; show key strokes quickly
(setq echo-keystrokes 0.1)

(global-set-key (kbd "C-c t") 'insert-date)
(defun insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d"))
)

(global-set-key (kbd "C-c g f") 'ffap-other-window)

;; switch window with shift + arrow keys
(windmove-default-keybindings)

;;;;;;;;;;;;;;;;;;;;;;;;;; dired ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'top)
(setq dired-recursive-copies 'always)
(require 'dired-x)
;; press C-x C-j jump into dired of your current dir
(global-set-key [(control x) (control j)] 'dired-jump)
(setq dired-guess-shell-alist-user
      (list
       (list "\\.chm$" "chmsee * &")
       (list "\\.pdf$" "evince * &")
       (list "\\.mkv$" "mplayer * >/dev/null 2>&1 &")
       (list "\\.avi$" "mplayer * >/dev/null 2>&1 &")
       (list "\\.rmvb$" "mplayer * >/dev/null 2>&1 &")
       (list "\\.rm$" "mplayer * >/dev/null 2>&1 &")
       (list "\\.mp3$" "playsound * &")
       ))

(setq-default dired-listing-switches "-alhF")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Document Plugins
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set load-path
(setq load-path (cons "~/blog/emacs-lisp" load-path))

;; Org Mode
(setq user-full-name "Jiqing Wu")
(setq user-mail-address "jiqingwu@gmail.com")
(setq org-log-done 'time)
(setq org-agenda-files (list "~/blog/gtd/todo.org"
                             "~/blog/gtd/someday.org"))

;; publish entry onto wordpress blog with webblogger
(require 'weblogger)

;; draw pic with graphviz in emacs
(load-file "~/blog/emacs-lisp/graphviz-dot-mode.el")

;; write screenplay in emacs
(require 'screenwriter)
(setq auto-mode-alist (cons '("\\.scp" . screenwriter-mode)
			    auto-mode-alist))

;; open MSword document in emacs
(autoload 'no-word "no-word" "word to txt")
(add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word))
(setq no-word-coding-systems '(("iso-8859-1" "8859-1.txt")
                               ("utf-8" "UTF-8.txt"))
      no-word-default-coding "utf-8")


;; Latex
(setq latex-run-command "xelatex")

;;;;;;;;;;;;;;;;;;;;;;;; sdcv ;;;;;;;;;;;;;;;;;;;;;;;;;;
;; author: pluskid
;; 调用 sdcv 来查辞典
;; 如果选中了 region 就查询 region 的内容，否则查询当前光标所在的单词
;; 查询结果在一个叫做 *sdcv* 的 buffer 里面显示出来，在这个 buffer 里面
;; 按 q 可以把这个 buffer 放到 buffer 列表末尾，按 d 可以查询单词
;; (global-set-key (kbd "C-c d") 'kid-sdcv-to-buffer)
;; (defun kid-sdcv-to-buffer ()
;;   (interactive)
;;   (let ((word (if mark-active
;;                   (buffer-substring-no-properties
;;                    (region-beginning) (region-end))
;;                   (current-word nil t))))
;;     (setq word (read-string
;;                 (format "Search the dictionary for (default %s): " 
;;                         word) nil nil word))
;;     (set-buffer (get-buffer-create "*sdcv*"))
;;     (buffer-disable-undo)
;;     (erase-buffer)
;;     (let ((process (start-process-shell-command "sdcv" "*sdcv*"
;;                                                 "sdcv" "-n" word)))
;;       (set-process-sentinel
;;        process
;;        (lambda (process signal)
;;          (when (memq (process-status process) '(exit signal))
;;            (unless (string= (buffer-name) "*sdcv*")
;;              (setq kid-sdcv-window-configuration
;;                    (current-window-configuration))
;;              (switch-to-buffer-other-window "*sdcv*")
;;              (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
;;              (local-set-key (kbd "q") (lambda ()
;;                                         (interactive)
;;                                         (bury-buffer)
;;                                         (unless (null (cdr (window-list))) ; only one window
;;                                           (delete-window)))))
;;            (goto-char (point-min))))))))

;; for now, We have the sdcv-mode.el from  pluskid
(require 'sdcv-mode)
(global-set-key (kbd "C-c d") 'sdcv-search)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Coding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [(f9)] 'next-error)
(global-set-key [(f10)] 'compile)

;; go to a line by giving its number,
;; which is bound to M-g in XEmacs
(global-set-key [(meta g)] 'goto-line)

;; smart expand
;; (global-set-key [(meta ?/)] 'hippie-expand)
;; (setq hippie-expand-try-functions-list
;;       '(try-expand-dabbrev
;;         try-expand-dabbrev-visible
;;         try-expand-line
;;         try-complete-file-name
;;         try-complete-file-name-partially
;;         try-expand-dabbrev-all-buffers
;;         try-expand-dabbrev-from-kill
;;         try-expand-all-abbrevs
;;         try-expand-list
;;         try-complete-lisp-symbol-partially
;;         try-complete-lisp-symbol))

;; If you use gtags to browse source code
(autoload 'gtags-mode "gtags" "" t)

;; write javascript with emacs
;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Emacs 自带 python 模式
;; (setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) 
;;                               auto-mode-alist))
;; (autoload 'python-mode "python-mode.el" "Python mode." t)

;; (add-hook 'python-mode-hook 'hs-minor-mode)
;; (global-set-key [(control c) (z)] 'hs-hide-block)
;; (global-set-key [(control c) (x)] 'hs-show-block) 
;; (global-set-key [(control c) (h)] 'hs-hide-all)
;; (global-set-key [(control c) (s)] 'hs-show-all) 
;; (setq hs-allow-nesting t)

;; lua mode for emacs
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) 
			    auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; php mode for emacs
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) 
                              auto-mode-alist))
(autoload 'php-mode "php-mode.el" "Php mode." t)


;;---------------- CC-Mode -----------------------

(require 'cc-mode)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(setq default-tab-width 4)
;; replace tabs with spaces
(setq-default indent-tabs-mode nil)

;; my own indent style
;; (setq c-basic-offset 4)
;; (setq c-offsets-alist '((arglist-cont-nonempty . ++)
;;                         (inline-open . 0)
;;                         (substatement-open 0)))

(add-hook 'c-mode-hook '(lambda()
                          (c-set-style "stroustrup")
                          (c-toggle-auto-newline 1)
                          (c-toggle-hungry-state)
                          ;; (which-function-mode t)
                          (setq indent-tabs-mode nil)
                          ;; (c-subword-mode 1)
                          ))

;;---------------- CEDET -----------------------

(require 'cedet)
;;(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:
;;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-gaudy-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)

;; Enable source code folding
(global-semantic-tag-folding-mode 1)

;;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员
;; (defun my-c-mode-cedet-hook ()
;;   (local-set-key "." 'semantic-complete-self-insert)
;;   (local-set-key ">" 'semantic-complete-self-insert))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; Key bindings
(defun my-cedet-hook ()
;;(local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key (kbd "C-c ?") 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c j") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c r") 'semantic-symref-symbol)
  (local-set-key (kbd "C-c R") 'semantic-symref))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;;;;自动补齐策略
;; (defun my-indent-or-complete ()
;;    (interactive)
;;    (if (looking-at "//>")
;;           (hippie-expand nil)
;;           (indent-for-tab-command))
;; )
 
;; (global-set-key [(tab)] 'my-indent-or-complete)
 
(autoload 'senator-try-expand-semantic "senator")
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(
        senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        try-expand-all-abbrevs
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        )
      )

;;---------------- ECB -----------------------
;; (require 'ecb-autoloads)

;;---------------- JDE-Mode -----------------------

;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)

;; Update the Emacs load-path to include the path to
;; the JDE and its require packages. This code assumes
;; that you have installed the packages in the emacs/site
;; subdirectory of your home directory.
;; 加载所需的package
(add-to-list 'load-path (expand-file-name 
                         "~/blog/emacs-lisp/jdee-2.4.0.1/lisp/"))
(add-to-list 'load-path (expand-file-name
			 "~/blog/emacs-lisp/elib-1.0/"))

;; If you want Emacs to defer loading the JDE until you open a
;; Java file, edit the following line
;; 不自动加载jde-mode
(setq defer-loading-jde t)

(setq jde-check-version-flag nil)

;; 编辑.java文件时加载jde
;; (if defer-loading-jde
;;     (progn
;;       (autoload 'jde-mode "jde" "JDE mode." t)
;;       (setq auto-mode-alist
;;             (append
;;              '(("\\.java\\'" . jde-mode))
;;              auto-mode-alist)))
;;   (require 'jde))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; W3m
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'w3m-load)
(provide 'w3m-e23)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
;;(setq w3m-home-page (expand-file-name "~/blog/index.html"))
(setq w3m-home-page "about:blank")
(setq w3m-default-display-inline-image t)
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EMMS with mplayer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(require 'emms-setup)
;;(emms-minimalistic)
;;(emms-standard)
;;(setq emms-player-list '(emms-player-mplayer)
;;      emms-player-mplayer-command-name "mplayer"
;;      emms-player-mplayer-parameters '("-slave"))
;;(setq emms-repeat-playlist nil
;;      emms-source-file-default-directory "/data/music/"
;;      emms-lyrics-dir "/data/music/"
;;      emms-lyrics-coding-system nil
;;      emms-playlist-buffer-name "*EMMS*")
;; show info at mode-line
;;(require 'emms-mode-line)
;;(emms-mode-line 1)
;; show time of music
;;(require 'emms-playing-time)
;;(emms-playing-time 1)
;; show lyrics
;;(require 'emms-lyrics)
;;(emms-lyrics 1)
;; auto identify encode
;;(require 'emms-i18n)
;; auto save and import playlist
;;(require 'emms-history)
;;(emms-history-load)

;;(global-set-key (kbd "C-c e g") 'emms-play-directory)
;;(global-set-key (kbd "C-c e d") 'emms-play-dired)
;;(global-set-key (kbd "C-c e v") 'emms-playlist-mode-go)
;;(global-set-key (kbd "C-c e x") 'emms-start)
;;(global-set-key (kbd "C-c e SPC") 'emms-pause)
;;(global-set-key (kbd "C-c e s") 'emms-stop)
;;(global-set-key (kbd "C-c e n") 'emms-next)
;;(global-set-key (kbd "C-c e p") 'emms-previous)


