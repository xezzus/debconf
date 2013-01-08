"-------------------------
" Базовые настройки
"-------------------------
" удалить создание служебных и дополнительных файлов
set nobackup
set nowritebackup
set noswapfile
" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible
" Включаем нумерацию строк
set nu
" Не переносить длинные строки
set nowrap
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=10
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=10
" Шрифт
set guifont=Liberation\ Mono\ 9
" Кодировка текста по умолчанию
set termencoding=utf-8
" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=h
" Сделать строку команд высотой в одну строку
set ch=1
" Скрывать указатель мыши, когда печатаем
set mousehide
" Влючить подстветку синтаксиса
syntax on
" Цветовая схема
colors jellybeans
" Преобразование Таба в пробелы
set expandtab
" Размер табулации по умолчанию
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2
" игнорировать регистр при поиске
set ic
" использовать инкрементальный поиск
set is
" опции сессий
set sessionoptions=curdir,buffers,tabpages
"-------------------------
" Горячие клавишы
"-------------------------
" C-c and C-v - Copy/Paste в
vmap <C-c> "+y
imap <C-v> <esc>"+gpa
map <C-v> "+gP
" Ctrl-s : быстрое сохранение
nmap <C-s> :w<cr>
vmap <C-s> <esc>:w<cr>a
imap <C-s> <esc>:w<cr>a
" Ctrl-n : новая вкладка
nmap <C-n> :tabnew<cr>
vmap <C-n> <esc>:tabnew<cr>a
imap <C-n> <esc>:tabnew<cr>a
" Ctrl-p : VimCommander
nmap <C-p> :cal VimCommanderToggle()<cr>
vmap <C-p> <esc>:cal VimCommanderToggle()<cr>
imap <C-p> <esc>:cal VimCommanderToggle()<cr>
" Shift-k - разделяет строку надвое
map <S-k> i<cr><esc>
" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv
" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on
"-------------------------
" Taglist
"-------------------------

"-------------------------
" PHP настройки
"-------------------------
" Включаем фолдинг для блоков классов/функций
let php_folding = 0
" Не использовать короткие теги PHP для поиска PHP блоков
let php_noShortTags = 1
" Подстветка SQL внутри PHP строк
let php_sql_query=1
" Подстветка HTML внутри PHP строк
let php_htmlInStrings=1 
let php_baselib = 1                                   " Подстветка базовых функций PHP
