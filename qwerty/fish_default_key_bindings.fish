 
function fish_default_key_bindings -d "Ergo-Emacs like key bindings for fish"

	# Clear earlier bindings, if any
	bind --erase --all

	# This is the default binding, i.e. the one used if no other binding matches
	bind "" self-insert
	
	bind \e\n "commandline -i \n"

	# OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
	bind -k home beginning-of-line 2> /dev/null
	bind -k end end-of-line 2> /dev/null
	bind \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-delete

	bind \eu upcase-word
	# This clashes with __fish_list_current_token
	# bind \el downcase-word
	bind \ec capitalize-word
	bind -k ppage beginning-of-history
	bind -k npage end-of-history
	bind \e\< beginning-of-buffer
	bind \e\> end-of-buffer

	bind \ew 'set tok (commandline -pt); if test $tok[1]; echo; whatis $tok[1]; commandline -f repaint; end'
	bind \cl 'clear; commandline -f repaint'
	bind \cc 'commandline ""'
	bind \cu backward-kill-line
	bind \ed kill-word
	bind \cw backward-kill-path-component
	bind \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
	bind \cd delete-or-exit

	# This will make sure the output of the current command is paged using the less pager when you press Meta-p
	bind \ep '__fish_paginate'
	
	# term-specific special bindings
	switch "$TERM"
		case 'rxvt*'
			bind \e\[8~ end-of-line
			bind \eOc forward-word
			bind \eOd backward-word
	end

	# ergo-emacs bindings
	
	bind \eu backward-word
	bind \eo forward-word

	bind \el forward-char
	bind \ej backward-char
	bind \ei up-or-search
	bind \ek down-or-search

	bind -k right forward-char
	bind -k left backward-char
	bind -k down down-or-search
	bind -k up up-or-search
	bind [C forward-char
	bind [D backward-char
	bind [B down-or-search
	bind [A up-or-search

	bind \er kill-word
	bind \ee backward-kill-word
	bind \ed backward-delete-char
	bind \ef delete-char

	bind -k btab backward-delete-char
	bind -k backspace backward-delete-char
	bind \x7f backward-delete-char
	bind -k dc delete-char

	bind \eh beginning-of-line
	bind \eH end-of-line

	bind \eg backward-kill-line
	bind \eG kill-line

	bind \ec yank-pop
	bind \ev yank

	bind \cj complete
	bind \cM execute
	bind -k enter execute
	


	# TODO: still unbound
	# __fish_list_current_token
	# transpose-chars
	# transpose-words
	# history-search-backward
	# history-search-forward
	# history-token-search-forward
	# history-token-search-backward
	# nextd-or-forward-word
	# prevd-or-backward-word
end
