""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (up to 3).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy scoping,
"
" Jason Duell       jduell@alumni.princeton.edu     7/30/2001
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags
    set csto=0

    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
	endif

    " show msg when any other cscope db added
	set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the same cscope search types
    " with the word under the cursor:
    "
    "   s   symbol: finds all references to token under cursor
    "   g   global: find global definition(s) of token under cursor
    "   c   calls:  find all calls to function name under cursor
    "   t   text:   find any instances of text under cursor
    "   e   egrep:  egrep search for word under cursor
    "   f   file:   goto filename under cursor
    "   i   includes: find files that include filename under cursor
    "   d   called: find functions that function under cursor calls
    "
    " I've used CTRL-@ as the start key for all three versions of my maps
    " (regular, horizontal split, and vertical split), because on my machine
    " (and probably yours), it also maps to CTRL-spacebar, which is very easy
    " to hit.  Hit CTRL-spacebar, followed by one of the cscope search types
    " above (s,g,c,t,e,f,i,d), and the result of your cscope search will be
    " displayed in the current window (you can use CTRL-T to go back to where
    " you were before the search).  Hit 'h' or 'v',
    " followed by one of the search type keys,  when you want the search
    " result to show up in a new window (resulting from a horizontal or
    " vertical split, respectively).
    "
    " If you don't like using 'CTRL-@', or you don't like three-key typemaps,
    " you can change some or all of these maps to use other keys. Some likely
    " candidates for the first key in your mapping:
    "
    "   'CTRL-\':  Default use in vim is as part of CTRL-\ CTRL-N typemap,
    "              which basically just does the same thing as hitting ESC.
    "
    "   'CTRL-_':  Is the same as CTRL-/, which is easier to type (no shift).
    "              By default is used to switch between Hebrew and English
    "              keyboard mode.
    "
    "   'CTRL-A':  By default, adds [count] to number under the cursor: I've
    "              certainly never used it. 

    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

    " Typing 'h' before search type makes window split horizontally, with
    " search result displayed in the new window.
    nmap <C-@>hs :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>hg :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>hc :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>ht :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>he :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>hf :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>hi :scs find i <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>hd :scs find d <C-R>=expand("<cword>")<CR><CR>	

    " Typing 'v' before search type makes window split horizontally, with
    " search result displayed in the new window.
    nmap <C-@>vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>vi :vert scs find i <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>	


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for 'keys codes' (like <F1>), you should also set ttimeout and
    " ttimeoutlen: otherwise, you will experience strange delays as vim waits
    " for a keystroke after you hit ESC (it will be waiting to see if the ESC
    " is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or
    " network connection, set it higher.  If you don't set ttimeoutlen, the
    " value for timeoutlent (default: 1000) is used
    "
    "set ttimeoutlen=100

endif


