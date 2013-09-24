"===========================
"Set common things
"===========================
set nocompatible
"set mouse=a
set mouse=v
set nu
"Set indent
set autoindent
set smartindent
"Set tab width and shift width
set tabstop=4
set shiftwidth=4
"set expandtab
"Show current mod
set showmode
"Underline current line
set cursorline

"Set colorscheme
colorscheme darkblue
"colorscheme elflord-Ex
"colorscheme desert
syntax on

"Set terminal color bits
"set t_Co=8
"set t_Co=256


"console colorscheme tweaks
""set t_Co=256
"colorscheme delek
"hi folded ctermfg=darkyellow ctermbg=black
"hi comment ctermfg=darkgrey
"hi statusline ctermbg=black ctermfg=darkyellow
"hi statuslinenc ctermbg=darkyellow ctermfg=black
"popup menu color tweaks since 7.3.524
"hi pmenu ctermfg=white
"hi pmenu ctermbg=green
"hi pmenusel ctermfg=white
"hi pmenusel ctermbg=white
hi pmenusel ctermbg=green

"Set search
set incsearch
set hlsearch
set ignorecase smartcase
filetype plugin on
"make markdown as an recognizable file type
autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown,*.mkd :set filetype=markdown

"Chinese Encoding
"let &termencoding=&encoding
"set fileencodings=utf-8,gbk,ucs-bom,cp936
"set enc=utf8 
"set fencs=utf8,gbk,gb2312,gb18030,cp936 

"设定文件编码类型，彻底解决中文编码问题
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠

"===========================
"Auto complet ()
"===========================
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap {<CR> {<CR>}<ESC>O
:inoremap { {}<ESC>i
":inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap "<SPACE> ""<ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap /* /**/<ESC>hi

function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endfunction

"===========================
"Set ctags
"===========================
set tags+=tags;
set autochdir
set tags=tags;
set complete=i
set complete+=t
"set autochdir
set tags+=~/.vim/tags/c_src/tags
set tags+=/home/benjamin/Projects/ldd3-env/linux-2.6.34/tags
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/fl
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

"===========================
"Set cscope
"===========================
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	"set cst
	"set cspc=3
	"set csverb
	set nocsverb
	"add any database in current dir
	if filereadable("cscope.out")
		cs add cscope.out
	"else search cscope.out elsewhere
	else
	   let cscope_file=findfile("cscope.out", ".;")
	   let cscope_pre=matchstr(cscope_file, ".*/")
	   if !empty(cscope_file) && filereadable(cscope_file)
		   exe "cs add" cscope_file cscope_pre
	   endif      
	 endif
endif

"===========================
"Set global
"===========================
"set cscopeprg=gtags-cscope
"cs add GTAGS 

"===========================
"LookupFile setting
"===========================
"if filereadable("filenametags")
    "let g:LookupFile_TagExpr = '"./filenametags"' 
"else
    "let lookup_file=findfile("filenametags", ".;")
    "let lookup_pre=matchstr(lookup_file, ".*/")
   "if !empty(lookup_file) && filereadable(lookup_file)
       "exe "let g:LookupFile_TagExpr='\"".lookup_pre lookup_file."\"'"
    "endif
"endif


"===========================
" winManager setting
"===========================
"let g:winManagerWindowLayout = 'BufExplorer,FileExplorer|TagList'
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' 
" What windows should it
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <C-W><C-F> :FirstExplorerWindow<CR>
"nmap <C-W><C-B> :BottomExplorerWindow<CR>
"nmap <silent> <leader>wm :WMToggle<CR>
"nnoremap <silent> <F7> :WMToggle<CR>
"nnoremap <silent> <C-W><C-M> :WMToggle<CR>
"===========================
" Taglist setting
"===========================
"show only one file's tag
"let Tlist_Show_One_File = 1
"exit when there's only taglist window
"let Tlist_Exit_OnlyWindow = 1
"auto close when file is not edited
"let Tlist_File_Fold_Auto_Close = 1
"show Tlist's menue
"let Tlist_Show_Menue = 1
nmap q :qa<CR>
"===========================
" Tagbar setting
"===========================
nmap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

"===========================
" NERDTree setting
"===========================
map <F2> :silent! NERDTreeToggle<CR>

"===========================
" Doxygen setting
"===========================
"let g:DoxygenToolkit_briefTag_pre="@Synopsis" 
"let g:DoxygenToolkit_paramTag_pre="@Param " 
"let g:DoxygenToolkit_returnTag="@Returns" 
"let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockHeader="============================================================================"
"let g:DoxygenToolkit_blockFooter="============================================================================"
let g:DoxygenToolkit_authorName="zzz.Mraz™(zzz.Mraz@gmail.com)" 
"let g:DoxygenToolkit_licenseTag="My own license"
nmap <C-D><C-L> gg:DoxLic<CR>
nmap <C-D><C-A> :DoxAuthor<CR>
nmap <C-D><C-D> :Dox<CR>
nmap <C-D><C-B> :DoxBlock<CR>
nmap <C-D><C-U> :DoxUndoc<CR>
"===========================
" snipMate setting
"===========================
let g:snips_author = 'zzz.Mraz™'
"map \cc ^i//<ESC>
"map \cx ^xx
"map \ss ^i#<ESC>
"map \sx ^x
"map \vv ^i"<ESC>
"map \vx ^x
map \cx i /*----------------------------------------------------------------------------<CR>----------------------------------------------------------------------------*/<ESC>O
map \cd i// ----------------------------------------------------------------------------<CR>
vmap <C-S-M>  dO#endif<ESC>PO#if 0<ESC>
map \rr :call CompileRun()<CR>
map \dd :call Debug()<CR>

" 定义CompileRun函数，用来调用进行编译和运行
func CompileRun()
	exec "w"
	"exec "!rm %<"
	"C程序
	if &filetype == 'c'
		set makeprg=gcc\ -Wall\ -g\ -o\ %<\ %
		exec "make"
		exec "!./%<"
	elseif &filetype == 'cpp'
		set makeprg=g++\ -Wall\ -g\ -o\ %<\ %
		exec "make"
		exec "!./%<"
	"ARM ASM程序
	elseif &filetype == 'asm'
		exec "!arm-linux-gcc -o %<.o % -c"
	"Markdown程序
	elseif &filetype == 'markdown'
		exec "!markdown % > %<.html"
		exec "!w3m %<.html"
		"You can use html2text instead of w3m
		"exec "!html2text %<.html"
	"Java程序
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	"Perl程序
	elseif &filetype == 'pl'
		exec "!perl %<"
	"Python程序
	elseif &filetype == 'py'
		exec "!python %<CR>"
	"Tex文档
	elseif &filetype == 'tex'
		exec "!latex %"
		exec "!dvipdf %<.dvi"
		exec "!evince %<.pdf"
	endif
endfunc
"结束定义CompileRun

"定义Debug函数，用来调试程序
func Debug()
	exec "w"
	"C程序
	if &filetype == 'c'
		exec "!gcc % -g -o %<"
		exec "!clewn -va %<.c"
	elseif &filetype == 'cpp'
		exec "!g++ % -g -o %<"
		exec "!gdb %<"
	"Java程序
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!jdb %<"
	endif
endfunc
"结束定义Debug

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
"command -nargs=* Make make <args> | cwindow 3

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"OmniCpp配置
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

"vimwiki
let wiki_1 = {}
let wiki_1.path = '~/Dropbox/vimwiki/life/'
let wiki_1.path_html = '~/Dropbox/vimwiki/life/html/'

let wiki_2 = {}
let wiki_2.path = '~/Dropbox/vimwiki/programming/'
let wiki_2.path_html = '~/Dropbox/vimwiki/programming/html/'
"let wiki_2.nested_syntaxes = {'python': 'python', 'c': 'c', 'c++': 'cpp', 'asm': 'S'}
let wiki_2.html_header = '~/Dropbox/vimwiki/vimwiki_html/header.tpl'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_2.template_path = '~/Dropbox/vimwiki/template/'
let wiki_2.template_default = 'template'
let wiki_2.template_ext = '.html'

let wiki_3 = {}
let wiki_3.path = '~/Dropbox/vimwiki/ok6410/'
let wiki_3.path_html = '~/Dropbox/vimwiki/ok6410/html/'
"let wiki_3.nested_syntaxes = {'python': 'python', 'c': 'c', 'c++': 'cpp', 'asm': 'S'}
let wiki_3.html_header = '~/Dropbox/vimwiki/vimwiki_html/header.tpl'
let wiki_3.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_3.template_path = '~/Dropbox/vimwiki/template/'
let wiki_3.template_default = 'template'
let wiki_3.template_ext = '.html'

let wiki_4 = {}
let wiki_4.path = '~/Dropbox/vimwiki/software/'
let wiki_4.path_html = '~/Dropbox/vimwiki/software/html/'
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4]
"let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
    "\ 'path_html': '~/Dropbox/vimwiki/html/',
    "\ 'template_path': '~/Dropbox/vimwiki/template/',
    "\ 'template_default': 'template',
    "\ 'template_ext': '.html'}]
let g:vimwiki_camel_case = 1
"done cheklist will show special color
let g:vimwiki_hl_cb_checked = 1
"tell vimwiki not to extend these files to *.c.html for example
let g:vimwiki_file_exts = 'c, cpp, wav, txt, h, hpp, zip, sh, awk, ps, pdf'
"not map tab key
let g:vimwiki_table_mappings = 0
"map <F4> <Plug>Vimwiki2HTML
"map <F4> :Vimwiki2HTML<CR> :Vimwiki2HTMLBrowse<CR>
"nmap \wb :VimwikiAll2HTML<CR> :Vimwiki2HTMLBrowse<CR>
"nmap \wb :Vimwiki2HTML<CR> :Vimwiki2HTMLBrowse<CR>
nmap \wb :Vimwiki2HTMLBrowse<CR>

"pathogen
execute pathogen#infect()
