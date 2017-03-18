"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => new file header
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.cc, exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1, "\# File Name: ".expand("%")) 
        call append(line("."), "\# Author: yunpengx") 
        call append(line(".")+1, "\# mail: yunpengx@andrew.cmu.edu") 
        call append(line(".")+2, "\# Created Time: ".strftime("%D")) 
        call append(line(".")+3, "\#!/bin/bash") 
        call append(line(".")+4, "") 
    else
        call setline(1, "\/**") 
        call append(line("."), "    * File Name: ".expand("%")) 
        call append(line(".")+1, "    * Author: yunpengx") 
        call append(line(".")+2, "    * Mail: yunpengx@andrew.cmu.edu") 
        call append(line(".")+3, "    * Created Time: ".strftime("%D")) 
        call append(line(".")+4, "*/") 
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
