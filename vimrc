" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

syntax on        "語法上色顯示                                                                                                                          
set ai           "自動縮排                                                                                                                              
set shiftwidth=4 "設定縮排寬度4                                                                                                                         
set ruler        "顯示右下角參數,如第幾行第幾個字                                                                                                       
set backspace=2  "在 insert 也可用 backspace                                                                                                            
set ic           "設定搜尋忽略大小寫                                                                                                                    
set hlsearch     "設定高亮度顯示搜尋結果                                                                                                                
set incsearch    "在關鍵字還沒完全輸入完畢前就顯示結果                                                                                                  
set smartindent  "設定 smartindent                                                                                                                      
set confirm      "操作過程有衝突時，以明確的文字來詢問                                                                                                  
set history=200  "保留 200 個使用過的指令                                                                                                               
set cursorline   "顯示目前的游標位置                                                                                                                    
set number       "顯示行數                                                                                                                              
nohl            "搜尋不會有底色                                                                                                                        
set nowrap      "字串太長不自動換行                                                                                                                    
colorscheme torte "個人喜好顏色配置
set autowrite    " Automaticaaly save 


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"#######################################################
" Color
set t_Co=256
set hlsearch
hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
hi CursorColumn cterm=none ctermbg=DarkMagenta ctermfg=White
hi Search cterm=reverse ctermbg=none ctermfg=none
 
 "#######################################################
 " statusline
 set laststatus=2
 set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]
 hi filepath cterm=none ctermbg=238 ctermfg=40
 hi filetype cterm=none ctermbg=238 ctermfg=45
 hi filesize cterm=none ctermbg=238 ctermfg=225
 hi position cterm=none ctermbg=238 ctermfg=228
 function IsBinary()
     if (&binary == 0)
        return ""
     else
        return "[Binary]"
     endif
 endfunction
	
 function FileSize()
     let bytes = getfsize(expand("%:p"))
     if bytes <= 0
        return "[Empty]"
     endif
     if bytes < 1024
        return "[" . bytes . "B]"
     elseif bytes < 1048576
       return "[" . (bytes / 1024) . "KB]"
     else
       return "[" . (bytes / 1048576) . "MB]"
     endif
 endfunction
