" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  "au! BufRead,BufNewFile *.mine		setfiletype mine
  "au! BufRead,BufNewFile *.xyz		setfiletype drawing
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux
augroup END
