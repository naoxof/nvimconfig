-- 文字コード設定
-- （NeovimではencodingはUTF-8デフォルトです）
-- vim.o.encoding = 'utf-8'    -- Lua では不要になるケースが多い
vim.o.fileencoding = 'utf-8'

-- 編集中のファイルが外部で変更されたら自動で読み直す
vim.o.autoread = true

-- バッファが編集中でも他のファイルを開けるように
vim.o.hidden = true

-- 入力中のコマンドをステータスに表示する
vim.o.showcmd = true

-- 行番号を表示
vim.wo.number = true

-- スマートインデント
vim.o.smartindent = true

-- 括弧入力時の対応する括弧を表示
vim.o.showmatch = true

-- シンタックスハイライト有効化
-- Lua では :syntax on 相当を実行させるなら下記のように書けます
vim.cmd('syntax enable')

-- 不可視文字の可視化（タブを「▸-」と表示）
vim.o.list = true
vim.o.listchars = 'tab:▸-'

-- Tab文字を半角スペースにする
vim.o.expandtab = true

-- タブ幅設定
vim.o.tabstop = 4       -- 行頭以外のTab表示幅
vim.o.shiftwidth = 4    -- 自動インデント等で使われるTab幅

-- ESCを2回押した時に検索ハイライトを消す
vim.keymap.set('n', '<ESC><ESC>', ':nohl<CR>', { silent = true })

-- Leaderキーをスペースキーに
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- アンダースコアを単語の区切りとして認識させる
vim.opt.iskeyword:append('_')

-- 検索中の選択範囲に対して"*"を実行→ cgn で置換
vim.keymap.set('n', '<leader>*', "*''cgn")

-- 新規タブでターミナルモードを起動
vim.keymap.set('n', 'tt', '<cmd>terminal<CR>', { silent = true })

-- 下分割でターミナルモードを起動
vim.keymap.set('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR><cmd>resize 10<CR>', { silent = true })

-- ターミナルを開いたら常にinsertモードに入る
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd('startinsert')
  end
})

-- ウインドウの不透明度
vim.api.nvim_set_hl(0, "Normal", {
  bg      = "none",  -- 旧 guibg=NONE に相当
  ctermbg = "none",  -- 旧 ctermbg=NONE に相当
})

-- 行番号の色を上書き
vim.cmd("highlight LineNr cterm=NONE ctermfg=250 guifg=#aaaaaa")

-- カーソル行番号の色を上書き
vim.cmd("highlight CursorLineNr cterm=bold ctermfg=255 guifg=#ffffff")

-- Visual モード時の選択範囲の背景色を上書き
vim.cmd [[
  highlight Visual cterm=NONE ctermbg=239 guibg=#777777

]]

------------------------------------------------------------------------------
-- ターミナルモードのキーバインド
------------------------------------------------------------------------------

-- ノーマルモードへ戻る
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], { silent = true })

-- 新規バッファを開く
vim.keymap.set('t', '<C-W>n', '<cmd>new<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-N>', '<cmd>new<cr>', { silent = true })

-- バッファ・ウィンドウを閉じる/終了
vim.keymap.set('t', '<C-W>q', '<cmd>quit<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-Q>', '<cmd>quit<cr>', { silent = true })
vim.keymap.set('t', '<C-W>c', '<cmd>bd!<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-C>', '<cmd>bd!<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-W>', '<cmd>bd!<cr>', { silent = true })

-- 縦横移動
vim.keymap.set('t', '<C-W><Down>', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-J>', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-W>j', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('t', '<C-W><Up>', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-K>', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-W>k', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('t', '<C-W><Left>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-H>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W><BS>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W>h', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('t', '<C-W><Right>', '<cmd>wincmd l<cr>', { silent = true })
vim.keymap.set('t', '<C-W><C-L>', '<cmd>wincmd l<cr>', { silent = true })
vim.keymap.set('t', '<C-W>l', '<cmd>wincmd l<cr>', { silent = true })


require("config.lazy")
------
-- dpp
------
-- 
-- local denops_src = vim.fn.stdpath("cache") .. "/dpp/repos/github.com/denops/denops.vim"
-- local dpp_src = vim.fn.stdpath("cache") .. "/dpp/repos/github.com/Shougo/dpp.vim"
-- local dpp_installer = vim.fn.stdpath("cache") .. "/dpp/repos/github.com/Shougo/dpp-ext-installer"
-- 
-- if not vim.loop.fs_stat(denops_src) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "https://github.com/vim-denops/denops.vim.git",
--     denops_src
--   })
--   vim.notify("Successfull denops.vim installed!", vim.log.levels.INFO)
-- end
-- 
-- if not vim.loop.fs_stat(dpp_src) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "https://github.com/Shougo/dpp.vim.git",
--     dpp_src
--   })
--   vim.notify("Successfull dpp.vim installed!", vim.log.levels.INFO)
-- end
-- 
-- if not vim.loop.fs_stat(dpp_installer) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "https://github.com/Shougo/dpp-ext-installer.git",
--     dpp_installer
--   })
--   vim.notify("Successfull dpp-ext-installer installed!", vim.log.levels.INFO)
-- end
-- 
-- local dpp_base = vim.fn.stdpath("cache") .. "/dpp"
-- 
-- local dpp_ext_toml = dpp_base .. "/repos/github.com/Shougo/dpp-ext-toml"
-- if not vim.loop.fs_stat(dpp_ext_toml) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "https://github.com/Shougo/dpp-ext-toml.git",
--     dpp_ext_toml
--   })
--   vim.notify("dpp-ext-toml installed!", vim.log.levels.INFO)
-- end
-- 
-- local dpp_ext_lazy = dpp_base .. "/repos/github.com/Shougo/dpp-ext-lazy"
-- if not vim.loop.fs_stat(dpp_ext_lazy) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "https://github.com/Shougo/dpp-ext-lazy.git",
--     dpp_ext_lazy
--   })
--   vim.notify("dpp-ext-lazy installed!", vim.log.levels.INFO)
-- end
-- 
-- local dpp_protocol_git = dpp_base .. "/repos/github.com/Shougo/dpp-protocol-git"
-- if not vim.loop.fs_stat(dpp_protocol_git) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "https://github.com/Shougo/dpp-protocol-git.git",
--     dpp_protocol_git
--   })
--   vim.notify("dpp-protocol-git installed!", vim.log.levels.INFO)
-- end
-- 
-- 
-- -- runtimepath に追加
-- vim.opt.runtimepath:prepend(dpp_src)
-- vim.opt.runtimepath:prepend(dpp_ext_toml)
-- vim.opt.runtimepath:prepend(dpp_ext_lazy)
-- vim.opt.runtimepath:prepend(dpp_protocol_git)
-- 
-- -- dpp のロード設定
-- local dpp = require("dpp")
-- local dpp_config = vim.fn.stdpath("config") .. "/dpp/config.ts"
-- 
-- if dpp.load_state(dpp_base) then
--   -- Denops などが必要になるので、ここで追加
--   vim.opt.runtimepath:prepend(denops_src)
--   vim.opt.runtimepath:prepend(dpp_installer)
-- 
--   vim.api.nvim_create_autocmd("User", {
--     pattern = "DenopsReady",
--     callback = function()
--       vim.notify("dpp load_state() is failed")
--       dpp.make_state(dpp_base, dpp_config)
--     end,
--   })
-- end
-- 
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "Dpp:makeStatePost",
--   callback = function()
--     vim.notify("dpp make_state() is done")
--   end,
-- })
-- 
-- -- 既存設定
-- vim.cmd("filetype indent plugin on")
-- vim.cmd("syntax on")
